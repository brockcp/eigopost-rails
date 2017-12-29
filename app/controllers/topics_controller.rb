class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new
    @topic.name = params[:topic][:name]
    @topic.description = params[:topic][:description]
    @topic.public = params[:topic][:public]
    @topic.user = current_user
    if @topic.save
      flash[:notice] = "Saved"
      redirect_to @topic
    else
      flash.now[:alert] = "Not Saved"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.name = params[:topic][:name]
    @topic.description = params[:topic][:description]
    if @topic.save
      flash[:notice] = "Saved!"
      redirect_to @topic
    else
      flash.now[:alert] = "Error!"
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      flash[:notice] = "\"#{@topic.name}\" was deleted."
      redirect_to @topic
    else
      flash.now[:alert] = "Couldnt delete."
      render :show
    end
  end

end
