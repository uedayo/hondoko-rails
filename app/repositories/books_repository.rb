class BooksRepository
  include BooksRepositoryBase

  def handle_amazon_error
    raise AmazonError, "Failed to get data from amazon"
  end

end