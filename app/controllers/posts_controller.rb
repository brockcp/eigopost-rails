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
        flash[:notice] = "Saved"
        redirect_to @post
      else
        flash.now[:alert] = "Not Saved"
        render :new
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      @post.name = params[:post][:name]
      @post.description = params[:post][:description]
      if @post.save
        flash[:notice] = "Saved!"
        redirect_to @post
      else
        flash.now[:alert] = "Error!"
        render :edit
      end
    end

    def destroy
      @post = Post.find(params[:id])
      if @post.destroy
        flash[:notice] = "\"#{@post.name}\" was deleted."
        redirect_to @post
      else
        flash.now[:alert] = "Couldnt delete."
        render :show
      end
    end

  end
