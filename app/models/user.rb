class User < ActiveRecord::Base
  belongs_to :division
  validates_presence_of :last_name_kanji, :first_name_kanji, :last_name_hiragana, :first_name_hiragana, :email, :division
  validate :email, :check_email

  before_save :create_remember_token

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def check_email
      errors.add(:email, I18n.t('view.error_email')) if email == EXAMPLE_EMAIL
    end
end
