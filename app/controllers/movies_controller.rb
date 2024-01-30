class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    conn = Faraday.new("https://api.themoviedb.org")
    response = conn.get("/3/movie/top_rated")
  end
end