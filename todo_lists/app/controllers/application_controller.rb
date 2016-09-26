class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
<<<<<<< HEAD
  # protect_from_forgery with: :exception

  helper_method :current_user, :login, :require_login

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
    @current_user ? @current_user : nil
  end

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_login
    redirect_to new_sesion_url unless current_user
  end

=======
  protect_from_forgery with: :exception
>>>>>>> old_i/master
end
