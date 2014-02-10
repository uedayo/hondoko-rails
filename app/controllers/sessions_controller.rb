class SessionsController < ApplicationController
  def new
    @users = User.all
    p @users
  end

  def create
    p
    user = User.find_by_id params[:session][:user_id]
    if user
      sign_in user
      redirect_to users_path
    else
      # TODO rediredt to login
    end
  end

  def destroy

  end
end
