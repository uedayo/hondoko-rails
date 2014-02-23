class Item < ActiveRecord::Base
  belongs_to :book
  belongs_to :area

  def self.find_detail book_id
    ActiveRecord::Base.connection.select(<<-SQL
          SELECT item_id, volume, area_id, area_name, e.check_out_id, user_id, last_name_kanji, first_name_kanji, image_url, checked_out_at, due_date, check_ins.id AS check_in_id, check_ins.created_at AS checked_in_at FROM (
          SELECT item_id, volume, area_id, area_name, check_out_id, user_id, last_name_kanji, first_name_kanji, image_url, checked_out_at, due_date FROM (
          SELECT a.id AS item_id, volume, area_id, area_name, c.id AS check_out_id, user_id, checked_out_at, due_date FROM (
          SELECT items.id, volume, area_id, name AS area_name FROM items LEFT OUTER JOIN areas ON area_id = areas.id WHERE book_id = #{book_id}
          ) a LEFT OUTER JOIN (
          SELECT check_outs.id, check_outs.item_id, user_id, checked_out_at, due_date FROM check_outs, (
          SELECT item_id, MAX(created_at) checked_out_at FROM check_outs GROUP BY item_id
          ) b WHERE check_outs.item_id = b.item_id AND check_outs.created_at = checked_out_at
          ) c  ON a.id = item_id
          ) d LEFT OUTER JOIN users ON d.user_id = users.id
          ) e LEFT OUTER JOIN check_ins ON e.check_out_id = check_ins.check_out_id;
    SQL
    )
  end
end
