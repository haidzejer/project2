class HeartController < ApplicationController
respond_to :js

  def heart
    @user = current_user
    @post = Post.find(pararms[:id])
    Heart.create(user_id: @user, post_id: @post)
  end

  def unheart
    @user = current_user
    @post = Post.find(params[:id])
    @heart = @user.hearts.find_by_post_id(@post.id)
    @heart.destroy
  end
end
