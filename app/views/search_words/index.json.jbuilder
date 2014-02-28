json.array!(@search_words) do |search_word|
  json.extract! search_word, :id, :user_id, :word
  json.url search_word_url(search_word, format: :json)
end
