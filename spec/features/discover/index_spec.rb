require "rails_helper"

RSpec.describe "Discover Movies: Search By Title", type: :feature do
  describe "When a user visits '/users/:id/discover'" do
    before(:each) do
      @user1 = User.create!(name: "Taylor Swift", email: "taylorswift@gmail.com")
      @user2 = User.create!(name: "Travis Kelce", email: "traviskelce@gmail.com")
    end
    # As a user,
    # When I visit the '/users/:id/discover' path (where :id is the id of a valid user),
    # I should see
    # - a Button to Discover Top Rated Movies
    # - a text field to enter keyword(s) to search by movie title
    # - a Button to Search by Movie Title
    it "They see a button to Discover Top Rated Movies" do
      visit "/users/#{@user1.id}/discover"

      expect(page).to have_button("Discover Top Rated Movies")
    end
    it "They see a text field to enter keyword(s) to search by movie title" do
      visit "/users/#{@user1.id}/discover"

      expect(page).to have_field("search")
      expect(page).to have_button("Search By Movie Title")
    end
  end
end