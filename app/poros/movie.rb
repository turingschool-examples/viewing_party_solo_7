class Movie
  attr_reader :id, :title, :vote_average, :runtime, :genres, :overview, :cast, :reviews

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @overview = data[:overview]
    @cast = data[:cast]
    @reviews = data[:reviews]
  end
end
