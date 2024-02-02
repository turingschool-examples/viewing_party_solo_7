require 'rails_helper'

describe 'the movies index page' do
  before :each do
    @user_1 = User.create!(name: 'Sam', email: 'sam_t@email.com')
    @user_2 = User.create!(name: 'Tommy', email: 'tommy_t@gmail.com')

    # After clicking on the discover page's "Top Rated Movies" button OR Search button, I should be taken to the movies results page (users/:user_id/movies)
    visit user_discover_index_path(@user_1)
    click_button 'Discover Top Rated Movies'
  end

  it "shows the titles of each movie as a link to the movie detail page (US-2)", :vcr do
    expect(page).to have_link("The Shawshank Redemption")

    click_link("The Shawshank Redemption")

    expect(current_path).to eq(user_movie_path(@user_1, id: 278))
  end
end