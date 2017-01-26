class Admin::VotesController < ApplicationController

  # GET /votes
  # GET /votes.json
  def index
    is_admin_logged
      @votes = Vote.all
	  @votest1 = Vote.where(id_tour: 1)
	  @resultst1 = Vote.where(id_tour: 1).group(:id_candidate).count.sort_by(&:last)
	  @votest2 = Vote.where(id_tour: 2)
	  @resultst2 = Vote.where(id_tour: 2).group(:id_candidate).count.sort_by(&:last).reverse.first(2)
	  @candidates = Candidate.all
  end

end
