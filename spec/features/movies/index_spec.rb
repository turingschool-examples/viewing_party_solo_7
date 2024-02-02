require 'rails_helper'

describe 'the movies index page', :vcr do
  before :each do
    @user_1 = User.create!(name: 'Sam', email: 'sam_t@email.com')
    @user_2 = User.create!(name: 'Tommy', email: 'tommy_t@gmail.com')

    # After clicking on the discover page's "Top Rated Movies" button OR Search button, I should be taken to the movies results page (users/:user_id/movies)
    visit user_discover_index_path(@user_1)
  end

  describe 'the Discover Top Rated Movies button' do
    before :each do
      click_button 'Discover Top Rated Movies'
    end

    it "shows the titles of each movie as a link to the movie detail page (US-2)" do
      expect(page).to have_link("The Shawshank Redemption")

      click_link("The Shawshank Redemption")

      expect(current_path).to eq(user_movie_path(@user_1, id: 278))
    end

    it "shows the vote average of each movie (US-2)" do
      expect(page).to have_content("Average Rating: 8.7") # Hate to hardcode something so easily changed, but not sure how to test this currently
    end

    it "shows only 20 results (US-2)" do
      expect(page).to have_content("20 Results")
    end
  end

  describe 'the Search by Movie Title button' do
    before :each do
      fill_in 'search_movies', with: 'shawshank'
      click_button 'Search Movies'
    end

    it "shows movies with titles containing the search query (US-2)" do
      expect(page).to have_link("The Shawshank Redemption")
      expect(page).to have_link("Shawshank: The Redeeming Feature")
      expect(page).to have_link("Hope Springs Eternal: A Look Back at The Shawshank Redemption")
    end
  end
end