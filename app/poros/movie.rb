class Movie
    attr_reader :id, :title, :vote_average, :runtime, :genres, :summary, :cast
    attr_accessor :cast

    def initialize(data)
        @id = data[:id]
        @title = data[:title]
        @vote_average = data[:vote_average]
        @runtime = data[:runtime] # .convert_mins_to_hours_and_mins
        @genres = data[:genres]
        @summary = data[:overview]
        @cast = []
    end
end

# Movie Title
# Vote Average of the movie
# Runtime in hours & minutes
# Genre(s) associated to movie
# Summary description
# List the first 10 cast members (characters & actress/actors)
# Count of total reviews
# Each review's author and information