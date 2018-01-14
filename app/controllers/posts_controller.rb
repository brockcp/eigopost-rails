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
      @post.name = params[:post][:name]
      @post.description = params[:post][:description]
      @post.public = params[:post][:public]
      @post.user = current_user
      if @post.save
        flash[:notice] = "Thank you. Your post is now online."
        redirect_to @post
      else
        flash.now[:alert] = "Not Saved"
        render :new
      end
    end

end
