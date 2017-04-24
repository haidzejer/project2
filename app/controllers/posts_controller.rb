class PostsController < ApplicationController

  before_action :authorize, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      redirect_to root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :_destroy)
  end

end
