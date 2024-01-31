require 'rails_helper'

describe 'the discover index page' do
  before :each do
    @user_1 = User.create!(name: 'Sam', email: 'sam_t@email.com')
    @user_2 = User.create!(name: 'Tommy', email: 'tommy_t@gmail.com')

    # When I visit the '/users/:id/discover' path (where :id is valid)
    visit user_discover_index_path(@user_1)
  end

  it 'shows a button to discover top rated movies (US-1)' do
    expect(page).to have_button('Discover Top Rated Movies')

    # When the user clicks the Top Rated Movies button, they should be taken to the movies results page
    click_button 'Discover Top Rated Movies'

    expect(current_path).to eq user_movies_path(@user_1)
  end

  it 'shows a text field to enter keywords to search by movie title (US-1)' do
    expect(page).to have_field('search_movies')
  end

  it 'shows a button to search by movie title (US-1)' do
    expect(page).to have_button('Search Movies')

    # When the user clicks the Search button, they should be taken to the movies results page
    click_button 'Search Movies'

save_and_open_page
    expect(current_path).to eq user_movies_path(@user_1)
  end
end
