require 'rails_helper'

RSpec.describe Movie, type: :poro do
  before do
    @movie = Movie.new({
      id: 11,
      title: "Star Wars",
      vote_average: 8.204,
      runtime: 121,
      genres: [{ name: "Science Fiction" }],
      overview: "Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.",
      cast: ["Mark Hamill", "Carrie Fisher", "Harrison Ford"],
      reviews: ["Excellent movie"],
    })
  end

  it 'is initialized with attributes' do
    expect(@movie.id).to eq(11)
    expect(@movie.title).to eq("Star Wars")
    expect(@movie.vote_average).to eq(8.204)
    expect(@movie.runtime).to eq(121)
    expect(@movie.genres).to eq([{ name: "Science Fiction" }])
    expect(@movie.overview).to eq("Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.")
    expect(@movie.cast).to eq(["Mark Hamill", "Carrie Fisher", "Harrison Ford"])
    expect(@movie.reviews).to eq(["Excellent movie"])
  end
end
