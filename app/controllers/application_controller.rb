class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user, :only => [:show, :delete, :update]
  helper_method :current_user

  # Checks if a user session exists.
  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  protected 
  def authenticate_user
    if session[:user_id]
     # set current user object to @current_user object variable
      @current_user = User.find(session[:user_id])
    else
      flash[:notice] = "Action requires login."
      redirect_to(:controller => 'static_pages', :action => 'home')
    end
  end
  def save_login_state
    if session[:user_id]
      redirect_to(:controller => 'static_pages', :action => 'home')
      false
    else
      true
    end
  end
end
