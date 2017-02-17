class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def already_logged_in
    if logged_in?
      current_user.errors[:already] << "logged in!"
      flash[:errors] = current_user.errors.full_messages
      redirect_to root_url
    end
  end

  def require_user!
    redirect_to new_session_url if current_user.nil?
  end
end
