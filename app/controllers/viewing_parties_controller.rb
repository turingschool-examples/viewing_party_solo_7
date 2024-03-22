class ViewingPartiesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    facade = MovieFacade.new({id: params[:movie_id]})
    @movie = facade.movie_information
    @viewing_party = ViewingParty.new(duration: @movie.runtime)
  end

  private

  def viewing_party_params
    params.require(:viewing_party).permit(:duration, :date, :start_time)
  end

  def create_user_party(user_id, viewing_party_id, is_host)
    UserParty.create(user_id: user_id, viewing_party_id: viewing_party_id, host: is_host)
  end
end
