class CommentsController < ApplicationController

    def create
      @post = Post.find(params[:post_id])
      comment = @post.comments.new(comment_params)
      comment.user = current_user

      if comment.save
        flash[:notice] = "Saved"
        redirect_to @post
      else
        flash.now[:alert] = "Not Saved"
        redirect_to @post
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

  end
