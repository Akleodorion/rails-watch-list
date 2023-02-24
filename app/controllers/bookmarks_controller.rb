class BookmarksController < ApplicationController
  def create
    @movie = Movie.find(params[:bookmark][:movie_id])
    p '-----------------------------------'
    @bookmark = Bookmark.new(comment: params[:bookmark][:comment], movie_id: @movie.id, list_id: params[:list_id])
    @bookmark.save!
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end
end
