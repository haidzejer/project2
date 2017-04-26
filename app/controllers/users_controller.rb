class UsersController < ApplicationController

  before_action :authorize_by_user, except: [:create, :new]

  def index
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    else
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:success] = "User Updated! 👍"
    redirect_to @user
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

end
