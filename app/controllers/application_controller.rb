require 'pry'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

protected

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  #another helper method 
  def fake_user
    
  end

  def only_for_admins
    if !current_user || !current_user.admin
      flash[:alert] = "You must be an admin to access that area."
      redirect_to movies_path
    end
  end

  helper_method :current_user
end
