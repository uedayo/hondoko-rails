json.array!(@browses) do |browse|
  json.extract! browse, :id, :user_id, :book_id, :search_word_id
  json.url browse_url(browse, format: :json)
end
