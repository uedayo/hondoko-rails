class LendController < ApplicationController
  require "amazon/ecs"

  def scan
    repo = BookItemRepository.new
    item = repo.find params[:isbn]
    render text: item.book.title
  end

  def regist
    check_out = CheckOut.new check_out_params
    check_out.save
    render text: check_out
  end

  def check_out_params
    params.require(:check_out).permit(
      :item_id,
      :user_id,
      :due_date
    )
  end
end
