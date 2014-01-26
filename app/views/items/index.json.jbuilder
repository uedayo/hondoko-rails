json.array!(@items) do |item|
  json.extract! item, :id, :book_id, :volume, :area_id
  json.url item_url(item, format: :json)
end
