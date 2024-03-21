class MovieFacade

  def initialize(params)
    @query = params[:query]
  end

  def movies
    if @query.present?
      search_movies
    else
      top_rated_movies
    end
  end

  private

  def search_movies
    json = MovieService.new.search_movies(@query)
    parse_movie_data(json)
  end

  def top_rated_movies
    json = MovieService.new.top_rated_movies
    parse_movie_data(json)
  end

  # https://apidock.com/rails/ActiveRecord/FinderMethods/take
  
  def parse_movie_data(json)
    json[:results].take(20).map do |movie_data|
      Movie.new(movie_data)
    end
  end

end
