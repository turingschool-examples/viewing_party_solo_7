require 'rails_helper'

describe 'the movies index page', :vcr do
    before :each do
        @user_1 = User.create!(name: 'Sam', email: 'sam_t@email.com')
        @user_2 = User.create!(name: 'Tommy', email: 'tommy_t@gmail.com')
    
        visit user_movie_path(@user_1, id: 278)
    end

    it "shows the movie's attributes: title, vote average, runtime (in hrs + mins), genres, and summary (US-3)" do
        expect(page).to have_content("The Shawshank Redemption")
        expect(page).to have_content("Average Rating: 8.7")
        expect(page).to have_content("Runtime: 2 hrs 22 mins")
        expect(page).to have_content("Description: Framed in the 1940s")
        expect(page).to have_content("Drama")
        expect(page).to have_content("Crime")
    end

    it "shows the movie's top 10 billed cast (US-3)" do
        expect(page).to have_content("Tim Robbins")
        expect(page).to have_content("Morgan Freeman")
        expect(page).to have_content("Bob Gunton")
        expect(page).to have_content("William Sadler")
        expect(page).to have_content("Clancy Brown")
        expect(page).to have_content("Gil Bellows")
        expect(page).to have_content("James Whitmore")
        expect(page).to have_content("Mark Rolston")
        expect(page).to have_content("Jeffrey DeMunn")
        expect(page).to have_content("Larry Brandenburg")
        expect(page).to_not have_content("Neil Giuntoli")
    end
end