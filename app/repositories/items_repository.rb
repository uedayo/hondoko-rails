class ItemsRepository

  def initialize(current_user)
    @current_user = current_user
  end

  def get_items_on_book_by_isbn(isbn)
    items = Item.find_detail_all_by_isbn isbn
    item_entities = []
    items.each do |item|
      item_entity = ItemOnBook.new(
          item_id: item['item_id'],
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
          checked_in_at: format_date(item['checked_in_at']),
      )
      item_entities << item_entity
    end
    item_entities
  end

  def get_item_on_book_by_item_id(item_id)
    item = Item.find_detail item_id
    ItemOnBook.new book_id: item.book_id,
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

  def get_items_on_user_by_user_id
    items = Item.find_owed_detail_all_by_user_id @current_user.id
    item_entities = []
    items.each do |item|
      item_entity = ItemOnUser.new item_id: item['item_id'],
                                   title: item['title'],
                                   author: item['author'],
                                   isbn: item['isbn'],
                                   small_image: item['small_image'],
                                   volume: item['volume'],
                                   area_id: item['area_id'],
                                   area_name: item['area_name'],
                                   check_status: ITEM_STATUS.OWED_BY_CURRENT_USER,
                                   check_out_id: item['check_out_id'],
                                   checked_out_at: format_date(item['checked_out_at']),
                                   due_date: format_date(item['due_date']),
                                   is_overdue: is_overdue?(item['due_date']),
                                   check_in_id: item['check_in_id'],
                                   checked_in_at: format_date(item['checked_in_at'])
      item_entities << item_entity
    end
    item_entities
  end

  def get_items_recently_added
    items = Item.find_recently_added DASHBOARD_ITEMS_AMOUNT
    item_entities = []
    items.each do |item|
      item_entity = ItemOnDashboardAdded.new(
          isbn: item['isbn'],
          item_id: item['item_id'],
          title: item['title'],
          author: item['author'],
          small_image: item['small_image'],
          volume: item['volume'],
          publication_date: format_publication_date(item['publication_date']),
          created_at: format_date(item['created_at']),
      )
      item_entities << item_entity
    end
    item_entities
  end

  def get_items_recently_checked_in
    items = Item.find_recently_checked_in DASHBOARD_ITEMS_AMOUNT
    item_entities = []
    items.each do |item|
      item_entity = ItemOnDashboardCheckedIn.new(
        isbn: item['isbn'],
        item_id: item['item_id'],
        title: item['title'],
        author: item['author'],
        small_image: item['small_image'],
        volume: item['volume'],
        area_id: item['area_id'],
        area_name: item['area_name'],
        checked_in_at: format_date(item['checked_in_at']),
      )
      item_entities << item_entity
    end
    item_entities
  end

  def get_items_well_read
    items = Item.find_well_read DASHBOARD_ITEMS_AMOUNT
    item_entities = []
    items.each do |item|
      item_entity = ItemOnDashboardWellRead.new(
          isbn: item['isbn'],
          item_id: item['item_id'],
          title: item['title'],
          author: item['author'],
          small_image: item['small_image'],
          volume: item['volume'],
          area_id: item['area_id'],
          area_name: item['area_name'],
          count: item['checked_in_count'],
      )
      item_entities << item_entity
    end
    item_entities
  end

  def get_items_not_read
    items = Item.find_not_read DASHBOARD_ITEMS_AMOUNT
    item_entities = []
    items.each do |item|
      item_entity = ItemOnDashboardNotRead.new(
          isbn: item['isbn'],
          item_id: item['id'],
          title: item['title'],
          author: item['author'],
          small_image: item['small_image'],
          volume: item['volume'],
          area_id: item['area_id'],
          area_name: item['area_name'],
      )
      item_entities << item_entity
    end
    item_entities
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

    def format_publication_date(date)
      date.present? ? date.gsub('-', '/') : I18n.t('view.na')
    end

    def is_overdue?(due_date)
      if due_date.present?
        due_date < Date.today
      else
        false
      end
    end
end