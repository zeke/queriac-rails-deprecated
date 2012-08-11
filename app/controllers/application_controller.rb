class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :ensure_ssl
  
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
  helper_method :current_user
  helper_method :logged_in?  
  def logged_in?
    current_user.present?
  end

  def authenticate
    redirect_to login_path unless logged_in?
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def ensure_ssl
    redirect_to :protocol => "https://" unless request.ssl? || request.local?
  end
  
end
