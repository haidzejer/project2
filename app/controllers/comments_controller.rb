class CommentsController < ApplicationController



  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
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
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
