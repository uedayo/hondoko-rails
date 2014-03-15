class UsersRepository
  def find_well_read_in_number
    users = User.find_well_read_in_number DASHBOARD_USERS_AMOUNT
    user_entities = []
    users.each do |user|
      user_entity = UserOnDashboard.new(
          id: user['user_id'],
          last_name_kanji: user['last_name_kanji'],
          first_name_kanji: user['first_name_kanji'],
          screen_name: user['screen_name'],
          image_url: user['image_url'],
          division: user['division_name'],
          read_count: user['check_in_count'],
      )
      user_entities << user_entity
    end
    user_entities
  end

  def find_owing
    users = User.find_owing DASHBOARD_USERS_AMOUNT
    user_entities = []
    users.each do |user|
      user_entity = UserOnDashboard.new(
          id: user['user_id'],
          last_name_kanji: user['last_name_kanji'],
          first_name_kanji: user['first_name_kanji'],
          screen_name: user['screen_name'],
          image_url: user['image_url'],
          division: user['division_name'],
          owing_count: user['check_out_count'],
      )
      user_entities << user_entity
    end
    user_entities
  end
end