require "rails_helper"
require "webmock"

RSpec.describe MovieService, type: :service do
  describe "search_movies" do
    it "fetches movies based on a query", :vcr do
      service = MovieService.new
      results = service.search_movies("star wars")

      expect(results).not_to be_empty
      expect(results[:results].first).to have_key(:title)
      expect(results[:results].first).to have_key(:vote_average)
    end
  end

  describe "top rated movies", :vcr do
    it "fetches top rated movies" do
      service = MovieService.new
      response = service.top_rated_movies

      expect(response[:results].first).to have_key(:title)
    end
  end
  
  describe "movie details", :vcr do
    it "fetches details for a specific movie" do
      service = MovieService.new
      response = service.movie_details(11)

      expect(response).to have_key(:title)
      expect(response).to have_key(:vote_average)
      expect(response).to have_key(:runtime)
      expect(response).to have_key(:genres)
      expect(response).to have_key(:overview)
    end
  end

  describe "movie reviews", :vcr do
    it "fetches reviews for a specific movie" do
      service = MovieService.new
      response = service.movie_reviews(11)

      expect(response[:results]).to be_an(Array)
    end
  end

  describe "movie credits", :vcr do
    it "fetches credits for a specific movie" do
      service = MovieService.new
      response = service.movie_credits(11)

      expect(response[:cast]).to be_an(Array)
      expect(response[:cast].any? { |actor| actor[:name] == "Mark Hamill" }).to be true
      expect(response[:cast].any? { |actor| actor[:name] == "Carrie Fisher" }).to be true
      expect(response[:cast].any? { |actor| actor[:name] == "Harrison Ford" }).to be true
      expect(response[:cast].any? { |actor| actor[:name] == "Tom Hanks" }).to be false
    end
  end
end
