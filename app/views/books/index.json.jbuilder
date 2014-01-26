json.array!(@books) do |book|
  json.extract! book, :id, :title, :author, :manufacturer, :small_image, :medium_image, :detail_page_url, :category_id
  json.url book_url(book, format: :json)
end
