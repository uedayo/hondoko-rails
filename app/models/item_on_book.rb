class ItemOnBook
  include ActiveModel::Model
  attr_accessor :book_id, :volume, :item_id, :area_id, :area_name, :check_status,
                :check_out_id, :user_id, :name_kanji, :image_url,
                :checked_out_at, :due_date, :is_overdue, :check_in_id, :checked_in_at
end
