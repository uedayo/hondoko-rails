class ItemOnUser
  include ActiveModel::Model
  attr_accessor :item_id, :book_id, :title, :author, :small_image, :volume, :area_id, :area_name, :check_status,
                :check_out_id, :checked_out_at, :due_date, :is_overdue, :check_in_id, :checked_in_at
end
