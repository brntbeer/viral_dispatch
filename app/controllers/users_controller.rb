class UsersController < ApplicationController
  before_filter :check_existing_user, only: :callback

  def callback
    @user = User.new
    @user.send("create_user_#{request.env['omniauth.auth'][:provider]}",request.env["omniauth.auth"])

    respond_to do |format|
      if @user.save
        session["user"] = {username: @user.username, login_type: @user.login_type}
        format.html { redirect_to root_url, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { redirect_to root_url, error: "There was an error with signing up with that account." }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def logout
    session.clear
    redirect_to root_url, notice: "Successfully logged out"
  end

  private

  def check_existing_user
    user = User.find_by_login_type(request.env['omniauth.auth'][:provider])
    if user
      session["user"] = {username: user.username, login_type: user.login_type}
      redirect_to root_url
    else
      session.clear
    end
  end
end
