class ViewingParty < ApplicationRecord

  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :date, :start_time

  def find_host
    users.where("user_parties.host = true").first
  end
end
