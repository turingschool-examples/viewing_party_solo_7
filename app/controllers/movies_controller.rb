class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new(params)
    @movies = @facade.movies
  end

  def show
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new(params)
    @movie = @facade.movie_information
  end
end
