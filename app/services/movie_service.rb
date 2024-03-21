class MovieService
  def conn
    Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
      faraday.headers["Authorization"] = ENV["TMDB_ACCESS_TOKEN_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_top_movies_service
    get_url("https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")
  end

  def get_search_results_service(keyword)
    get_url("https://api.themoviedb.org/3/search/movie?query=#{keyword}&include_adult=false&language=en-US&page=1")
  end

  def get_movie_service(id)
    get_url("https://api.themoviedb.org/3/movie/#{id}?language=en-US")
  end

  def get_movie_reviews_service(id)
    get_url("https://api.themoviedb.org/3/movie/#{id}/reviews?language=en-US&page=1")
  end

  def get_movie_cast_service(id)
    get_url("https://api.themoviedb.org/3/movie/#{id}/credits?language=en-US")
  end
end