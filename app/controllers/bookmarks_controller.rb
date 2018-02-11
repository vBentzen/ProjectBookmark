class BookmarksController < ApplicationController
  def show
   @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.url = params[:bookmark][:url]
    @bookmark.topic = Topic.find(params[:topic_id])

    if @bookmark.save
      flash[:notice] = "Bookmark was created!"
      redirect_to topics_path
    else
      flash.now[:alert] = "Failed creating bookmark, please try again."
      render :new
    end
  end

  def edit
   @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark is updated!"
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash.now[:alert] = "Someting went wrong, try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "Bookmark have been destroyed!"
      redirect_to @bookmark.topic
    else
      flash[:alert] = "Couldn't delete the bookmark, try again"
      redirect_to [@bookmark.topic, @bookmark]
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end