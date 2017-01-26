class Admin::VotesController < ApplicationController

  # GET /votes
  # GET /votes.json
  def index
    is_admin_logged
    @votes = Vote.all
	@results = Vote.group(:id_candidate).count
	@candidates = Candidate.all
  end

  def validation1
  	 Vote.where('id_tour = 1').update_all(vote_validation: "1")
  	 redirect_to action: "index"
  end

  def validation2
  	 Vote.where('id_tour = 2').update_all(vote_validation: "2")
  	 redirect_to action: "index"
  end

end
