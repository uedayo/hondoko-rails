class ItemOnDashboardCheckedIn
  include ActiveModel::Model
  attr_accessor :book_id, :volume, :item_id, :area_id, :area_name,
                :isbn, :title, :author, :small_image, :checked_in_at
end
