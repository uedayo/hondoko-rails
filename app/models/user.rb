class User < ActiveRecord::Base
  belongs_to :division
  validates_presence_of :last_name_kanji, :first_name_kanji, :email, :division
  validate :email, :check_email

  before_save :create_remember_token

  def self.find_well_read_in_number limit
    hash = ActiveRecord::Base.connection.select(<<-SQL
        SELECT user_id, check_in_count, last_name_kanji, first_name_kanji, screen_name, image_url, division_id, divisions.name division_name FROM (
        SELECT user_id, check_in_count, last_name_kanji, first_name_kanji, screen_name, image_url, division_id FROM (
        SELECT user_id, COUNT(*) check_in_count FROM check_ins i LEFT OUTER JOIN check_outs o ON
        i.check_out_id = o.id GROUP BY user_id ORDER BY check_in_count DESC LIMIT #{limit}
        ) read_counts LEFT OUTER JOIN users ON read_counts.user_id = users.id
        ) user_read_counts LEFT OUTER JOIN divisions ON user_read_counts.division_id = divisions.id;
    SQL
    )
    hash.map() { |item| OpenStruct.new(item) }
  end

  def self.find_owing limit
    hash = ActiveRecord::Base.connection.select(<<-SQL
        SELECT user_id, check_out_count, last_name_kanji, first_name_kanji, screen_name, image_url, division_id, divisions.name division_name FROM (
        SELECT user_id, check_out_count, last_name_kanji, first_name_kanji, screen_name, image_url, division_id FROM (
        SELECT user_id, count(*) check_out_count FROM check_outs LEFT OUTER JOIN check_ins ON
        check_out_id = check_outs.id WHERE check_out_id IS NULL GROUP BY user_id ORDER BY check_out_count DESC LIMIT #{limit}
        ) read_counts LEFT OUTER JOIN users ON read_counts.user_id = users.id
        ) user_read_counts LEFT OUTER JOIN divisions ON user_read_counts.division_id = divisions.id;
    SQL
    )
    hash.map() { |item| OpenStruct.new(item) }
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def check_email
      errors.add(:email, I18n.t('view.error_email')) if email == EXAMPLE_EMAIL
    end
end
