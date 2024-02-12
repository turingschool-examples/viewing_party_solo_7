class MoviesFacade
    def initialize(param)
        @param = param
    end

    def movies
        service = MovieDatabaseService.new
        if @param.nil? # If no search query provided, return 20 top rated
            json = service.get_top_rated_movies
        else # If search query provided, return movies by searched title
            json = service.get_movies_by_title(@param)
        end

        @movies = json[:results].map do |movie_data|
            Movie.new(movie_data)
        end
    end

    def movie_by_id
        service = MovieDatabaseService.new
        movie_json = service.get_movie_by_id(@param)
        movie_cast_json = service.get_movie_cast_by_id(@param)

        @movie = Movie.new(movie_json)
        @movie.cast = movie_cast_json[:cast]
        @movie
    end

    def movie_cast_by_id
        service = MovieDatabaseService.new
        movie_cast_json = service.get_movie_cast_by_id(@param)

        @movie_cast = movie_cast_json[:cast].map do |cast|  
            cast[:name]
        end
        @movie_cast.take(10)
    end

    def convert_mins_to_hours_and_mins(minutes)
        hours = minutes / 60
        remainder = minutes % 60
        "#{hours} hrs #{remainder} mins"
    end
end