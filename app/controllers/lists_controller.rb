class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def create
    @list = List.new(name: params[:list][:name])
    if @list.save
      redirect_to root_path
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def new
  end

  def show
    @list = List.find(params[:id])
    @movies = Movie.all
    @bookmark = Bookmark.new
  end

  def delete
  end
end
