class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_filter :login_required

  def handle_unverified_request
    sign_out
    super
  end

  private

  def login_required
    unless signed_in?
      redirect_to "/login"
    end
  end
end
