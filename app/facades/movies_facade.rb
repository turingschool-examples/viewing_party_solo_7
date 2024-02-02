class MoviesFacade
    def initialize(movie)
        @movie = movie
    end

    def movies
        service = MovieDatabaseService.new
        if @movie.nil? # If no search query provided, return 20 top rated
            json = service.get_top_rated_movies
        else # If search query provided, return movies by searched title
            json = service.get_movies_by_title(@movie)
        end

        @movies = json[:results].map do |movie_data|
            Movie.new(movie_data)
        end
    end
end