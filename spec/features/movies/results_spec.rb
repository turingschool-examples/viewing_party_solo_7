require "rails_helper"

RSpec.describe "Movies Results Page", type: :feature do 
  describe "When I click either the Discover Top Rated movies button or fill out the movie title search and click Search button I should be taken to the movies result page" do
    before(:each) do
      @user1 = User.create!(name: "Taylor Swift", email: "taylorswift@gmail.com")
      @user2 = User.create!(name: "Travis Kelce", email: "traviskelce@gmail.com")
    end
    # When I visit the discover movies page ('/users/:id/discover'),
    # and click on either the Discover Top Rated Movies button or fill out the movie title search and click the Search button,
    # I should be taken to the movies results page (`users/:user_id/movies`) where I see: 
    
    # - Title (As a Link to the Movie Details page (see story #3))
    # - Vote Average of the movie
    
    # I should also see a button to return to the Discover Page.
    it "Should see Title (as link to the Movie Details Page)" do
      visit "/users/#{@user1.id}/discover"

      click_button "Discover Top Rated Movies"

      expect(current_path).to eq("/users/#{@user1.id}/movies")

      expect(page).to have_link("Title:")
    end
    xit "Shows the vote average of the movie" do
      visit "/users/#{@user1.id}/discover"

      click_button "Discover Top Rated Movies"

      expect(current_path).to eq "/users/#{@user1.id}/movies"

      expect(page).to have_content("Vote Average:")
    end
    xit "Should see a button to return to the Discover Page" do
      
    end
  end
end
