class Admin::VotesController < ApplicationController

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
	@results = Vote.group(:id_candidate).count

	@candidates = Candidate.all
	@candidates.each do |candidate| 



  end

end

