class CommentsController < ApplicationController

  before_action :find_post
  before_action :find_comment, only: [:destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment Added! 👍"
      redirect_to :back
    else
      flash[:alert] = "Unable To Add Comment"
      redirect_to :back
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    if @comment.destroy
      flash[:success] = "Comment Deleted! 👍"
      redirect_to post_path(@post)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end

end
