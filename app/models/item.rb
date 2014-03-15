class Item < ActiveRecord::Base
  require 'ostruct'

  belongs_to :book
  belongs_to :area

  def self.find_detail_all_by_isbn isbn
    hash = ActiveRecord::Base.connection.select(<<-SQL
          SELECT item_id, volume, area_id, area_name, e.check_out_id, user_id, last_name_kanji, first_name_kanji, image_url, checked_out_at, due_date, check_ins.id AS check_in_id, check_ins.created_at AS checked_in_at FROM (
          SELECT item_id, volume, area_id, area_name, check_out_id, user_id, last_name_kanji, first_name_kanji, image_url, checked_out_at, due_date FROM (
          SELECT a.id AS item_id, volume, area_id, area_name, c.id AS check_out_id, user_id, checked_out_at, due_date FROM (
          SELECT items.id, volume, area_id, name AS area_name FROM items LEFT OUTER JOIN areas ON area_id = areas.id WHERE book_id IN (
          SELECT id FROM books WHERE isbn = #{isbn}
          )
          ) a LEFT OUTER JOIN (
          SELECT check_outs.id, check_outs.item_id, user_id, checked_out_at, due_date FROM check_outs, (
          SELECT item_id, MAX(created_at) checked_out_at FROM check_outs GROUP BY item_id
          ) b WHERE check_outs.item_id = b.item_id AND check_outs.created_at = checked_out_at
          ) c ON a.id = item_id
          ) d LEFT OUTER JOIN users ON d.user_id = users.id
          ) e LEFT OUTER JOIN check_ins ON e.check_out_id = check_ins.check_out_id;
    SQL
    )
    hash.map() { |item| OpenStruct.new(item) }
  end

  def self.find_detail item_id
    hash = ActiveRecord::Base.connection.select(<<-SQL
          SELECT book_id, volume, item_id, area_id, area_name, e.check_out_id, user_id, last_name_kanji, first_name_kanji, image_url, checked_out_at, due_date, check_ins.id AS check_in_id, check_ins.created_at AS checked_in_at FROM (
          SELECT book_id, volume, item_id, area_id, area_name, check_out_id, user_id, last_name_kanji, first_name_kanji, image_url, checked_out_at, due_date FROM (
          SELECT book_id, volume, a.id AS item_id, area_id, area_name, c.id AS check_out_id, user_id, checked_out_at, due_date FROM (
          SELECT check_outs.id, check_outs.item_id, user_id, checked_out_at, due_date FROM check_outs, (
          SELECT item_id, MAX(created_at) checked_out_at FROM check_outs GROUP BY item_id
          ) b WHERE check_outs.item_id = b.item_id AND check_outs.created_at = checked_out_at AND b.item_id = #{item_id}
          ) c LEFT OUTER JOIN (
          SELECT book_id, items.id, volume, area_id, name AS area_name FROM items LEFT OUTER JOIN areas ON area_id = areas.id
          ) a ON a.id = item_id
          ) d LEFT OUTER JOIN users ON d.user_id = users.id
          ) e LEFT OUTER JOIN check_ins ON e.check_out_id = check_ins.check_out_id;
    SQL
    )
    OpenStruct.new(hash[0])
  end

  def self.find_owed_detail_all_by_user_id user_id
    hash = ActiveRecord::Base.connection.select(<<-SQL
        SELECT book_id, volume, area_id, name AS area_name, item_id, checked_out_id, due_date, checked_out_at, checked_in_id, checked_in_at, title, author, small_image FROM (
        SELECT book_id, volume, area_id, item_id, checked_out_id, due_date, checked_out_at, checked_in_id, checked_in_at, title, author, small_image FROM (
        SELECT book_id, volume, area_id, item_id, checked_out_id, due_date, checked_out_at, checked_in_id, checked_in_at FROM (
        SELECT item_id, o.id AS checked_out_id, due_date, checked_out_at, check_ins.id AS checked_in_id, check_ins.created_at AS checked_in_at FROM (
        SELECT check_outs.id, check_outs.item_id, user_id, checked_out_at, due_date FROM check_outs, (
        SELECT item_id, MAX(created_at) checked_out_at FROM check_outs GROUP BY item_id
        ) b WHERE check_outs.item_id = b.item_id AND check_outs.created_at = checked_out_at AND user_id = #{user_id}
        ) o LEFT OUTER JOIN check_ins ON o.id = check_out_id WHERE check_out_id IS NULL
        ) io LEFT OUTER JOIN items ON io.item_id = items.id
        ) iio LEFT OUTER JOIN books ON book_id = books.id
        ) iio LEFT OUTER JOIN areas ON area_id = areas.id;
    SQL
    )
    hash.map() { |item| OpenStruct.new(item) }
  end

  def self.find_read_detail_all_by_user_id user_id
    hash = ActiveRecord::Base.connection.select(<<-SQL
        SELECT book_id, volume, area_id, name AS area_name, item_id, checked_out_id, due_date, checked_out_at, checked_in_id, checked_in_at, title, author, small_image FROM (
        SELECT book_id, volume, area_id, item_id, checked_out_id, due_date, checked_out_at, checked_in_id, checked_in_at, title, author, small_image FROM (
        SELECT book_id, volume, area_id, item_id, checked_out_id, due_date, checked_out_at, checked_in_id, checked_in_at FROM (
        SELECT item_id, o.id AS checked_out_id, due_date, checked_out_at, check_ins.id AS checked_in_id, check_ins.created_at AS checked_in_at FROM (
        SELECT check_outs.id, check_outs.item_id, user_id, checked_out_at, due_date FROM check_outs, (
        SELECT item_id, MAX(created_at) checked_out_at FROM check_outs GROUP BY item_id
        ) b WHERE check_outs.item_id = b.item_id AND check_outs.created_at = checked_out_at AND user_id = #{user_id}
        ) o LEFT OUTER JOIN check_ins ON o.id = check_out_id WHERE check_out_id IS NOT NULL
        ) io LEFT OUTER JOIN items ON io.item_id = items.id
        ) iio LEFT OUTER JOIN books ON book_id = books.id
        ) iio LEFT OUTER JOIN areas ON area_id = areas.id;
    SQL
    )
    hash.map() { |item| OpenStruct.new(item) }
  end

  def self.find_recently_checked_in limit
    hash = ActiveRecord::Base.connection.select(<<-SQL
        SELECT item_id, checked_in_at, book_id, volume, area_id, area_name, isbn, title, author, small_image FROM (
        SELECT item_id, checked_in_at, book_id, volume, area_id, name area_name FROM (
        SELECT item_id, checked_in_at, book_id, volume, area_id FROM (
        SELECT item_id, MAX(i.created_at) checked_in_at FROM check_ins i LEFT OUTER JOIN check_outs o ON i.check_out_id = o.id GROUP BY item_id ORDER BY checked_in_at DESC LIMIT #{limit}
        ) recent LEFT OUTER JOIN items ON recent.item_id = items.id
        ) recent_item LEFT OUTER JOIN areas ON recent_item.area_id = areas.id
        ) item LEFT OUTER JOIN books b ON item.book_id = b.id ORDER BY checked_in_at DESC;
    SQL
    )
    hash.map() { |item| OpenStruct.new(item) }
  end

  def self.find_well_read limit
    hash = ActiveRecord::Base.connection.select(<<-SQL
        SELECT item_id, checked_in_count, book_id, volume, area_id, area_name, isbn, title, author, small_image FROM (
        SELECT item_id, checked_in_count, book_id, volume, area_id, name area_name FROM (
        SELECT item_id, checked_in_count, book_id, volume, area_id FROM (
        SELECT item_id, COUNT(*) checked_in_count FROM check_ins i LEFT OUTER JOIN check_outs o ON
        i.check_out_id = o.id GROUP BY item_id ORDER BY checked_in_count DESC LIMIT #{limit}
        ) recent LEFT OUTER JOIN items ON recent.item_id = items.id
        ) recent_item LEFT OUTER JOIN areas ON recent_item.area_id = areas.id
        ) recent_item_area LEFT OUTER JOIN books b ON recent_item_area.book_id = b.id ORDER BY checked_in_count DESC;
    SQL
    )
    hash.map() { |item| OpenStruct.new(item) }
  end
end
