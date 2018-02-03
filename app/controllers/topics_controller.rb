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
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to topics_path, notice: "Topic was created!"
    else
      flash.now[:alert] = "Couldn't create topic, try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    @topic.assign_attributes(topic_params)

    if @topic.save
      flash[:notice] = "Topic is updated"
      redirect_to @topic
    else
      flash[:alert] = "Someting went wrong, try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
      redirect_to topics_path, notice: "Topic was deleted!"
    else
      flash[:alert] = "Topic couldn't be deleted, try again."
      render :show
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
end
