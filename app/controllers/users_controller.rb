class UsersController < ApplicationController
  def callback
    @user = User.new
    @user.send("create_user_#{request.env['omniauth.auth'][:provider]}",request.env["omniauth.auth"])
    binding.pry

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { redirect_to root_url, error: "There was an error with signing up with that account." }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end
end
