class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  private


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_logged
    if !session[:user_id]
      redirect_to :controller => 'sessions', :action => 'new', :notice => "Not logged"
    end
    if session[:admin_id]
      session[:admin_id] = nil
    end
  end

  def is_admin_logged
    if !session[:admin_id]
      redirect_to :controller => 'admin_connexions', :action => 'new', :notice => "Not logged"
    end
    if session[:user_id]
      session[:user_id] = nil
    end
  end
end
