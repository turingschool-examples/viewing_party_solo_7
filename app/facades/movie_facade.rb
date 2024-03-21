class MovieFacade

  def initialize(params)
    @query = params[:query]
    @movie_id = params[:id]
    @movie_service = MovieService.new
  end

  def movies
    if @query.present?
      search_movies
    else
      top_rated_movies
    end
  end

  def movie_information
    details = @movie_service.movie_details(@movie_id)
    credits_data = @movie_service.movie_credits(@movie_id)
    reviews_data = @movie_service.movie_reviews(@movie_id)

    movie = Movie.new(details)
    movie.cast = credits_data.fetch(:cast, []).take(10)
    movie.reviews = reviews_data.fetch(:results, [])
    movie
  end

  def search_movies
    json = MovieService.new.search_movies(@query)
    parse_movie_data(json)
  end

  def top_rated_movies
    json = MovieService.new.top_rated_movies
    parse_movie_data(json)
  end

  # https://apidock.com/rails/ActiveRecord/FinderMethods/take

  private

  def parse_movie_data(json)
    json[:results].take(20).map do |movie_data|
      Movie.new(movie_data)
    end
  end

end
