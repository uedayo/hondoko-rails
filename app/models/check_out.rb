class CheckOut < ActiveRecord::Base
  belongs_to :item
  belongs_to :user

  def self.get_last_operation item_id
    operations = find_by_sql(["SELECT * from check_outs WHERE item_id = :item_id order by created_at limit 1", {item_id: item_id}])
    operations.first
  end
end
