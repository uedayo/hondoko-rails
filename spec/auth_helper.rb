module AuthHelper
  def user_login
    create(:check_in)
  end

  def actor_logout
    session[:remember_token] = nil if session[:remember_token]
  end
end

include AuthHelper