class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    session['user']
  end

  def set_current_user(user)
    session["user"] = {username: user.username}
  end


  def require_login
    unless current_user
      redirect_to root_url, error: "Please login to perform that action" 
    end
  end
end
