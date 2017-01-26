class Admin::VotesController < ApplicationController

  # GET /votes
  # GET /votes.json
  def index
    is_admin_logged
    @votes = Vote.all
	@results = Vote.group(:id_candidate).count
	@candidates = Candidate.all
  end

end
