class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    I18n.locale = :tr
  end
  helper_method :current_admin, :logged_in?

  def current_admin
    @current_admin ||= AdminUser.find(session[:admin_user_id]) if session[:admin_user_id]
  end

  def logged_in?
    !!current_admin
  end

  def authenticate_admin!
    unless logged_in?
      redirect_to login_path, alert: "Bu sayfaya erişmek için giriş yapmalısınız."
    end
  end
end
