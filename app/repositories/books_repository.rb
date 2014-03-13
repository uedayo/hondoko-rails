class BooksRepository
  def find(isbn)
    book = Book.find_by isbn: isbn
    if book.blank?
      item_id = save_initial_book_and_item isbn
      Item.find_by_id item_id
    else
      Item.find_by book_id: book.id
    end
  end

  def save_initial_book_and_item(isbn)
    book = Book.where(isbn: isbn)
    if book.blank?
      new_book_by_amazon isbn
      book = Book.find_by_isbn isbn
      save_item book_id: book.id,
                volume: DEFAULT_VOLUME,
                area_id: DEFAULT_AREA_ID
    end
  end

  def save_item(book_id: book_id, volume: volume, area_id: area_id)
    item = Item.where(book_id: book_id, volume: volume, area_id: area_id)
    if item.blank?
      item = Item.new book_id: book_id,
                      volume: volume,
                      area_id: area_id
      item.save
      item.id
    end
  end

  def find_by_search_words(value)
    keys = value.split(/\s+/)
    books = Arel::Table.new :books
    sql = books.project(Arel.sql('*'))
    keys.each do |key|
      sql = sql.where(books[:title].matches('%' + key + '%').or(books[:author].matches('%' + key + '%')).or(books[:manufacturer].matches('%' + key + '%')))
    end
    sql = sql.to_sql
    Book.find_by_sql(sql)
  end

  private

  def new_book_by_amazon(isbn)
    res = MyAmazon.find isbn
    item = res.items.last

    book = Book.new isbn: isbn,
                    asin: item.get('ASIN'),
                    title: item.get('ItemAttributes/Title'),
                    author: item.get('ItemAttributes/Author'),
                    manufacturer: item.get('ItemAttributes/Manufacturer'),
                    publication_date: item.get('ItemAttributes/PublicationDate'),
                    small_image: item.get('SmallImage/URL'),
                    medium_image: item.get('MediumImage/URL'),
                    large_image: item.get('LargeImage/URL'),
                    price: item.get('ItemAttributes/ListPrice/Amount'),
                    currency: item.get('ItemAttributes/ListPrice/CurrencyCode')
    book.save
    book.id
  end

end