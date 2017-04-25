class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Incorrect login or password 😕"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = "Logged out! 👋"
    redirect_to root_path
  end
end