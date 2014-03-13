module Sessions

  def sign_in(user)
    session[:remember_token] = user.remember_token
    self.current_user = user
  end

  def signed_in?
    session[:remember_token].present?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    signed_in? ? User.find_by_remember_token(session[:remember_token]) : User.new
  end

  def sign_out
    self.current_user = nil
    session[:remember_token] = nil if session[:remember_token]
  end
end
