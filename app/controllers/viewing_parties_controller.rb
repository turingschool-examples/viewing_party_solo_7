class ViewingPartiesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    facade = MovieFacade.new({id: params[:movie_id]})
    @movie = facade.movie_information
    @viewing_party = ViewingParty.new(duration: @movie.runtime)
  end

  def create
    @viewing_party = ViewingParty.new(viewing_party_params)

    if @viewing_party.save
      create_user_party(params[:user_id], @viewing_party.id, true)

      guest_emails = params[:viewing_party][:guest_emails].reject(&:blank?)

      guest_emails.each do |email|
        guest = User.find_by(email: email)
        create_user_party(guest.id, @viewing_party.id, false) if guest
      end

      redirect_to user_path(params[:user_id])
    else
      render :new
    end
  end

  private

  def viewing_party_params
    params.require(:viewing_party).permit(:duration, :date, :start_time)
  end

  def create_user_party(user_id, viewing_party_id, is_host)
    UserParty.create(user_id: user_id, viewing_party_id: viewing_party_id, host: is_host)
  end
end
