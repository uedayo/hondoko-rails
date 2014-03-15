class DashboardController < ApplicationController
  def index
    item_repo = ItemsRepository.new @current_user
    @items = item_repo.get_items_on_user_by_user_id
    @items_checked_in = item_repo.get_items_recently_checked_in
    @items_well_read = item_repo.get_items_well_read
    user_repo = UsersRepository.new
    @users_well_read_in_number = user_repo.find_well_read_in_number
    @users_owing = user_repo.find_owing
  end
end
