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

end
