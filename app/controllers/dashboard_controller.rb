class DashboardController < ApplicationController
  def index
    repo = ItemsRepository.new @current_user
    @items = repo.get_items_on_user_by_user_id
    @items_checked_in = repo.get_items_recently_checked_in
    @items_well_read = repo.get_items_well_read
  end
end
