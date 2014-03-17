class MaintenanceController < ApplicationController
  require "csv"

  def initialize_books
    @seeds = Hash.new
    @books_repo = BooksRepository.new
    filepath = ENV['initial_isbn']
    if File.exists? filepath
      reader = CSV.foreach filepath
    else
      render text: 'No CSV file found.'
      return false
    end
    reader.each{ |row|
      isbn = row[0]
      category_id = row[1]
      if isbn == '0'
        logger.info("Succeeded in saving data from amazon. isbn: #{isbn} categoey_id: #{category_id}");
        next
      end
      @book = Book.where(isbn: isbn).first
      unless @book.present?
        @books_repo.save_initial_book_and_item isbn, category_id
        logger.info("Succeeded in saving data from amazon. isbn: #{isbn} categoey_id: #{category_id}");
      end
    }
    render text: 'Finished!'
  end
end
