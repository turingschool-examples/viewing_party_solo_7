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
    it "Should see Title (as link to the Movie Details Page) and the vote average", :vcr do
      visit "/users/#{@user1.id}/discover"

      click_button "Discover Top Rated Movies"

      expect(current_path).to eq("/users/#{@user1.id}/movies")
      
      expect(page).to have_content('Movie Title:', count: 20)
      
      expect(page).to have_link("The Shawshank Redemption")
      expect(page).to have_link("The Godfather")
      expect(page).to have_link("The Godfather Part II")
      expect(page).to have_link("Schindler's List")
      expect(page).to have_link("12 Angry Men")
      expect(page).to have_link("The Dark Knight")
      expect(page).to have_link("The Green Mile")
      expect(page).to have_link("Pulp Fiction")
      expect(page).to have_link("The Lord of the Rings: The Return of the King")
      expect(page).to have_link("Forrest Gump")
      
      within('#movie-238') do
        expect(page).to have_link('The Godfather')
        expect(page).to have_content('Vote Average: 8.707')
      end
      within('#movie-278') do
        expect(page).to have_link('The Shawshank Redemption')
        expect(page).to have_content('Vote Average: 8.711')
      end
      within('#movie-240') do
        expect(page).to have_link('The Godfather Part II')
        expect(page).to have_content('Vote Average: 8.591')
      end
    end
    it "Shows the vote average of the movie", :vcr do
      visit "/users/#{@user1.id}/discover"

      click_button "Discover Top Rated Movies"

      expect(current_path).to eq("/users/#{@user1.id}/movies")

      expect(page).to have_content('Vote Average', count: 20)
      save_and_open_page
    end
    it "Should see a button to return to the Discover Page", :vcr do
      visit "/users/#{@user1.id}/movies"

      expect(page).to have_button("Return To Discover Page")

      click_button "Return To Discover Page"

      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end
  end
end
