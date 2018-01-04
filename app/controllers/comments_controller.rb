class CommentsController < ApplicationController

    def show
      @comment = Comment.find(params[:id])
    end

    def new
      @post = Post.find(params[:post_id])
      @comment = Comment.new
    end

    def create
      @comment = Comment.new
      @comment.body = params[:comment][:body]
      @post = Post.find(params[:post_id])
      @comment.user = current_user
      @comment.post = @post
      if @comment.save
        flash[:notice] = "Saved"
        redirect_to @post
      else
        flash.now[:alert] = "Not Saved"
        render :new
      end
    end

    def edit
      @comment = Comment.find(params[:id])
    end

    def update
      @comment = Comment.find(params[:id])
      @comment.body = params[:comment][:body]
      if @comment.save
        flash[:notice] = "Saved!"
        redirect_to [@comment.post, @comment]
      else
        flash.now[:alert] = "Error!"
        render :edit
      end
    end

    def destroy
      @comment = Comment.find(params[:id])
      if @comment.destroy
        flash[:notice] = "\"#{@comment.title}\" was deleted."
        redirect_to @comment.post
      else
        flash.now[:alert] = "comment deleted."
        render :show
      end
    end

  end
