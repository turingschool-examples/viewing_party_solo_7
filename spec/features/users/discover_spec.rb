require 'rails_helper'

RSpec.describe "Users" do
  it "displays options to discover movies" do
    user = User.create!(name: "Test User", email: "test@example.com")

    visit discover_user_path(user)

    expect(page).to have_http_status(:success)
    expect(page.body).to include("Find Top Rated Movies")
    expect(page.body).to include("Search by Movie Title")
  end
end
