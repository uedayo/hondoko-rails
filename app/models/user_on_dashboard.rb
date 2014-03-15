class UserOnDashboard
  include ActiveModel::Model
  attr_accessor :id, :last_name_kanji, :first_name_kanji, :screen_name, :image_url, :division, :read_count, :owing_count
end
