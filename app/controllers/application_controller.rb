class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_account
  helper_method :logged_in?
  helper_method :notification_count
  helper_method :has_notification?
  helper_method :is_reviewer?

  # before_filter:set_cache_buster

  # def set_cache_buster
  #   response.headers["Cache-control"] = "no-cache, no-store, max-age=0, must-revalidate"
  #   response.headers["Pragma"] = "no-cache"

  def current_account
    Account.find_by(id: session[:account_id])
  end

  def logged_in?
    !current_account.nil?
  end

  def notification_count
    Account.find_by(id: session[:account_id]).notification
  end

  def has_notification?
    Account.find_by(id: session[:account_id]).notification > 0
  end

  def is_reviewer?
    Account.find_by(id: session[:account_id]).is_reviewer
  end
end