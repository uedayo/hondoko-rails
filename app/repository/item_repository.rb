class ItemRepository
  def find isbn
    book = Book.find_by isbn: isbn
    if book.blank?
      res = MyAmazon.find isbn
      item = res.items.last

      book = Book.new isbn: isbn,
                      asin: item.get('ASIN'),
                      title: item.get('ItemAttributes/Title'),
                      author: item.get('ItemAttributes/Author'),
                      manufacturer: item.get('ItemAttributes/Manufacturer'),
                      small_image: item.get('SmallImage/URL'),
                      medium_image: item.get('MediumImage/URL'),
                      large_image: item.get('LargeImage/URL'),
                      price: item.get('ItemAttributes/ListPrice/Amount'),
                      currency: item.get('ItemAttributes/ListPrice/CurrencyCode')
      book.save

      item = Item.new book_id: book.id,
                      volume: 1,
                      area_id: 1
      item.save
      item
    else
      Item.find_by book_id: book.id
    end
  end
end