class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    # session[:user_id] = nil
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #return the value of @current_user or set its value as User.find(sessions[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user  #current_user is method here
  end

  def authorize
    redirect_to new_session_path unless logged_in?
  end
end
