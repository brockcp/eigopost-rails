class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.new(comment_params)
    comment.user = current_user
    if comment.save
      flash[:notice] = "Saved!"
      redirect_to @post
    else
      flash[:notice] = "Not Saved"
      redirect_to @post
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment_body)
    end

  end
