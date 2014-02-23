class ItemsRepository
  def get_item_entity book_id, current_user
    items = Item.find_detail book_id
    item_entities = []
    items.each do |item|
      item_entity = ItemEntity.new item_id: item['item_id'],
                                   volume: item['volume'],
                                   area_id: item['area_id'],
                                   area_name: item['area_name'],
                                   check_status: check_status(item, current_user),
                                   check_out_id: item['check_out_id'],
                                   user_id: item['user_id'],
                                   name_kanji: name_kanji(item),
                                   image_url: item['image_url'],
                                   checked_out_at: format_date(item['checked_out_at']),
                                   due_date: format_date(item['due_date']),
                                   is_overdue: is_overdue?(item['due_date']),
                                   check_in_id: item['check_in_id'],
                                   checked_in_at: format_date(item['checked_in_at'])
      item_entities << item_entity
    end
    item_entities
  end

  private
    def check_status item, current_user
      if item['checked_in_at'].present?
        Status::ITEM_AVAILABLE
      elsif item['user_id'] == current_user.id
        Status::ITEM_OWED_BY_MYSELF
      elsif item['checked_out_at'].present?
        Status::ITEM_UNAVAILABLE
      else
        Status::ITEM_AVAILABLE
      end
    end

    def name_kanji item
      item['last_name_kanji'].present? ? "#{item['last_name_kanji']} #{item['first_name_kanji']}" : I18n.t('view.na')
    end

    def format_date date
      date.present? ? date.strftime("%Y/%m/%d") : I18n.t('view.na')
    end

    def is_overdue? duedate
      if duedate.present?
        duedate < Date.today
      else
        false
      end
    end
end