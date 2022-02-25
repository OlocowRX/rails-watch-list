class ListsController < ApplicationController
  before_action :set_params, only: %i[show]

  def index
    @lists = List.all
  end

  def show
    # @bookmarks = Bookmark.where(list_id: @list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render 'new'
    end
  end

  private

  # Strong Params
  def list_params
    params.require(:list).permit(:name)
  end

  def set_params
    @list = List.find(params[:id])
  end
end
