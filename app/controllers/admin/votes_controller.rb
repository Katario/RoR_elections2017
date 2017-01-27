class Admin::VotesController < ApplicationController

  # GET /votes
  # GET /votes.json
  def index
    is_admin_logged
    @votes = Vote.all
	@results = Vote.group(:id_candidate).count
	@candidates = Candidate.all
  @isboutonvalided1 = Vote.where(id_tour: 1).select(:vote_validation).first
  @isboutonvalided2 = Vote.where(id_tour: 2).select(:vote_validation).first
  end

  def validation1
  	@vote1 = Vote.where(id_tour: 1)

    if @vote1.update_all(vote_validation: 1)
  	  redirect_to admin_votes_path
    end
  end

  def validation2
  	 @vote2 = Vote.where(id_tour: 2)

      if @vote2.update_all(vote_validation: 1)
        redirect_to admin_votes_path
      end
  end
end
