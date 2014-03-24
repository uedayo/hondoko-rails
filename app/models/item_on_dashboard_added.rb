class ItemOnDashboardAdded
  include ActiveModel::Model
  attr_accessor :book_id, :volume, :item_id, :area_name,
                :isbn, :title, :author, :publication_date, :small_image, :created_at
end
