class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    @topic = Topic.find(params[:topic_id])
    @post.topic = @topic
    if @post.save
      flash[:notice] = "Saved"
      redirect_to [@topic, @post]
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
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    if @post.save
      flash[:notice] = "Saved!"
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "Error!"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted."
      redirect_to @post.topic
    else
      flash.now[:alert] = "post deleted."
      render :show
    end
  end

end
