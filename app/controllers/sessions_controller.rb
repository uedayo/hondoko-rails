class SessionsController < ApplicationController
  skip_before_filter :login_required

  def new
    @users = User.all
  end

  def create
    user = User.find_by_id params[:session][:user_id]
    if user
      sign_in user
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    sign_out
    redirect_to "/login"
  end
end
