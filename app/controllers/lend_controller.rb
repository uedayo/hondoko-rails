class LendController < ApplicationController
  require "amazon/ecs"

  def scan
    repo = BookItemRepository.new
    item = repo.find params[:isbn]
    render text: item.book.title
  end

  private

  def get_book_detail book_id
    #TODO if not found, store data from Amazon
    #TODO check DB again
  end
end
