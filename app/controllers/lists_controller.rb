class ListsController < ApplicationController
  before_action :set_params, only: %i[show edit update destroy]

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

  def edit; end

  def update
    if @list.update(list_params)
      redirect_to @list
    else
      render 'edit'
    end
  end

  def destroy
    @list.destroy

    redirect_to lists_path
  end

  private

  # Strong Params
  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def set_params
    @list = List.find(params[:id])
  end
end
