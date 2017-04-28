class StarsController < ApplicationController


  def index
    @stars = Star.all
  end

  def star
    @user = current_user
    @post = Post.find(params[:id])
    Star.create(user_id: @user, post_id: @post)
  end

  def unstar
    @user = current_user
    @post = Post.find(params[:id])
    @heart = @user.find_by_post_id(@post)
    @heart.destroy
  end

end
