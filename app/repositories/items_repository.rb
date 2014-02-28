class ItemsRepository

  def initialize(current_user)
    @current_user = current_user
  end

  def get_item_entities_by_isbn(isbn)
    items = Item.find_detail_all_by_isbn isbn
    item_entities = []
    items.each do |item|
      item_entity = ItemEntity.new item_id: item['item_id'],
                                   volume: item['volume'],
                                   area_id: item['area_id'],
                                   area_name: item['area_name'],
                                   check_status: check_status(item),
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

  def get_item_entity(item_id)
    item = Item.find_detail item_id
    ItemEntity.new book_id: item.book_id,
                   volume: item['volume'],
                   item_id: item.item_id,
                   area_id: item['area_id'],
                   area_name: item['area_name'],
                   check_status: check_status(item),
                   check_out_id: item['check_out_id'],
                   user_id: item['user_id'],
                   name_kanji: name_kanji(item),
                   image_url: item['image_url'],
                   checked_out_at: format_date(item['checked_out_at']),
                   due_date: format_date(item['due_date']),
                   is_overdue: is_overdue?(item['due_date']),
                   check_in_id: item['check_in_id'],
                   checked_in_at: format_date(item['checked_in_at'])
  end

  def get_item_status(item_id)
    item = Item.find_detail item_id
    check_status item
  end

  private
    def check_status(item)
      if item['checked_in_at'].present?
        ITEM_STATUS.AVAILABLE
      elsif item['user_id'] == @current_user.id
        ITEM_STATUS.OWED_BY_CURRENT_USER
      elsif item['checked_out_at'].present?
        ITEM_STATUS.UNAVAILABLE
      else
        ITEM_STATUS.AVAILABLE
      end
    end

    def name_kanji(item)
      item['last_name_kanji'].present? ? "#{item['last_name_kanji']} #{item['first_name_kanji']}" : I18n.t('view.na')
    end

    def format_date(date)
      date.present? ? date.strftime('%Y/%m/%d') : I18n.t('view.na')
    end

    def is_overdue?(due_date)
      if due_date.present?
        due_date < Date.today
      else
        false
      end
    end
end