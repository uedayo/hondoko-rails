class DashboardController < ApplicationController
  def index
    repo = ItemsRepository.new @current_user
    @items = repo.get_items_on_user_by_user_id
  end
end
