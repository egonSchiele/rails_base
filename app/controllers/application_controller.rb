class ApplicationController < ActionController::Base
  protect_from_forgery
  layout nil
  helper_method :current_user

  private

  def logged_in
    unless current_user
      flash[:notice] = "You are not logged in."
      redirect_to login_url
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
