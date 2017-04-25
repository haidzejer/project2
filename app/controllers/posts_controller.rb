class PostsController < ApplicationController

  before_action :authorize, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = "Challenge Added! 👍"
      redirect_to :back
    else
      flash[:alert] = "Unable To Add Challenge"
      redirect_to :back
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @user = @post.user
    @post.update(post_params)
    flash[:success] = "Post Edited! 👍"
    redirect_to @user
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:success] = "Challenge Deleted!"
      redirect_to :back
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
