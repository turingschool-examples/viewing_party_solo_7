class MovieService

  def initialize
    @conn = Faraday.new(url: "https://api.themoviedb.org/") do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.themoviedb[:key]
    end
  end

  def search_movies(query)
    response = @conn.get("/3/search/movie", query: query)
    parse_response(response)
  end

  def top_rated_movies
    response = @conn.get("/3/movie/top_rated")
    parse_response(response)
  end

  private

  def parse_response(response)
    return JSON.parse(response.body, symbolize_names: true)
  end
end
