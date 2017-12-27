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
    if @topic.save
      flash[:notice] = "Saved"
      redirect_to @topic
    else
      flash[:alert] = "Not Saved"
      render :edit
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      flash[:notice] = "\"#{@topic.name}\" was deleted."
      redirect_to action: :index
    else
      flash.now[:alert] = "Couldnt delete."
      render :show
    end
  end

end
