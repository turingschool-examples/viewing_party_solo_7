require 'rails_helper'


RSpec.describe 'Create new viewing party', type: :feature do
  describe 'new' do
    it 'assigns the requested user and sets up a new viewing party', :vcr do
      user = User.create!(name: 'Bob', email: 'bob@test.com')
      movie_id = '11'

      visit new_user_movie_viewing_party_path(user_id: user.id, movie_id: movie_id)

      expect(page).to have_content('New Viewing Party')
      expect(page).to have_selector('input', visible: :all)
      expect(page).to have_button('Create Party')
    end
  end

  # describe 'create' do
  #   it 'creates a viewing party', :vcr do
  #     user = User.create!(name: 'Bob', email: 'bob@test.com')
  #     movie_title = 'Star Wars'
  #     movie_runtime = 121

  #     visit new_user_movie_viewing_party_path(user_id: user.id, movie_id: '11')

  #     expect(page).to have_content(movie_title)

  #     fill_in 'Duration', with: movie_runtime
  #     fill_in 'Date', with: Date.tomorrow
  #     fill_in 'Start Time', with: '19:00'
  #     click_button 'Create Party'

  #     expect(ViewingParty.last.users).to include(user)
  #   end
  # end
end
