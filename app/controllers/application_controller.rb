class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_account
  helper_method :logged_in?
  helper_method :notification_count
  helper_method :has_notification?
  helper_method :is_reviewer?
  helper_method :is_admin?
  helper_method :check_completed

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

  def is_admin?
    current_account.admin
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

  def check_completed
    @sessions = @account.student.sessions.order(:start_time)
    @teaching_sessions = @account.tutor.sessions
    for s in @sessions
      if s.pending and s.start_time < Time.now and !s.completed
        s.update_attributes(:pending => true, :verified => false, :seen_student => false)
        s.student.account.price_cents += s.price.to_i
        s.student.account.notification += 1
        s.completed = true
        s.student.account.save
        s.save
      elsif s.verified and s.end_time < Time.now and !s.completed
        s.tutor.account.notification += 1
        s.tutor.account.save
        #s.tutor.account.price_cents += s.price.to_i
        s.completed = true
        s.seen = false
        s.save
      end
    end
    for s in @teaching_sessions
      if s.pending and s.start_time < Time.now and !s.completed
        s.update_attributes(:pending => true, :verified => false, :seen_student => false)
        s.student.account.price_cents += s.price.to_i
        s.student.account.notification += 1
        s.completed=true
        s.student.account.save
        s.save
      elsif s.verified and s.end_time < Time.now and !s.completed
        s.tutor.account.notification += 1
        s.tutor.account.save
        #s.tutor.account.price_cents += s.price.to_i
        s.completed = true
        s.seen = false
        s.save
      end
    end
  end
end