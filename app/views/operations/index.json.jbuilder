json.array!(@operations) do |operation|
  json.extract! operation, :id, :item_id, :user_id, :operation
  json.url operation_url(operation, format: :json)
end
