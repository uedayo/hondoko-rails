class LendController < ApplicationController
  require "amazon/ecs"

  def scan
    repo = BookItemRepository.new
    item = repo.find params[:isbn]
    render text: item.book.title
  end

  def regist
    operation = Operation.new operation_params
    operation.save
    render text: operation
  end

  def operation_params
    params.require(:operation).permit(
      :item_id,
      :user_id,
      :operation,
      :due_date
    )
  end
end
