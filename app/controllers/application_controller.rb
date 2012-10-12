class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    session['user']
  end

  def require_login
    unless current_user
      redirect_to root_url, error: "Please login to perform that action" 
    end
  end
end
