class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

helper_method :current_user, :logged_in?

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])

  end

  def logged_in?
    return nil if session[:session_token].nil?
    !User.find_by(session_token: session[:session_token])
  end

  def log_in_user!(user)
    # user.reset_session_token!
    session[:session_token] = user.reset_session_token!
  end



end



#current_user to return the current user.
#logged_in? to return a boolean indicating whether someone is signed in.
#log_in_user!(user) reset the users session token and cookie
