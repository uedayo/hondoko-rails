json.array!(@users) do |user|
  json.extract! user, :id, :screen_name, :last_name_kanji, :first_name_kanji, :last_name_hiragana, :first_name_hiragana, :image_url, :division_id
  json.url user_url(user, format: :json)
end
