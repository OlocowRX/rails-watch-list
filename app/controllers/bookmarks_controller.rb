class BookmarksController < ApplicationController
  before_action :set_params, only: %i[edit update destroy]

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    @list = List.find(params[:id])
    if @bookmark.update(bookmark_params)
      redirect_to @list
    else
      render 'edit'
    end
  end

  def destroy
    @bookmark.destroy

    redirect_to list_path(@bookmark.list)
  end

  private

  def set_params
    @bookmark = Bookmark.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
