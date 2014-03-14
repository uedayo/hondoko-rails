class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActionController::InvalidAuthenticityToken, with: :jump_to_index
  include Sessions
  before_filter :login_required, :set_current_user, :set_signed_in

  def handle_unverified_request
    sign_out
    super
  end

  def error
    begin
      if params['code'].present?
        message = I18n.t("view.#{params['code']}", :raise => I18n::MissingTranslationData)
        render text: message
        return false
      end
    rescue I18n::MissingTranslationData
      render text: I18n.t("view.error_i18n_error")
      return false
    end
    render text: I18n.t("view.error_default")
  end

  private

  def login_required
    unless signed_in?
      redirect_to "/login"
    end
  end

  def set_current_user
    @current_user = current_user
  end

  def set_signed_in
    @signed_in = signed_in?
  end

  def jump_to_index
    redirect_to root_path
  end
end
