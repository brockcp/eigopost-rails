class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.post_title = params[:post][:post_title]
    @post.post_body = params[:post][:post_body]
    @post.public = params[:post][:public]
    @post.user = current_user
    if @post.save
      flash[:notice] = "Thank you. Your post has been received."
      redirect_to @post
    else
      flash.now[:alert] = "Oops, that didnt work. Please check message below."
      render :new
    end
  end

end
