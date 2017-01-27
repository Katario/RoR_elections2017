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

	  @votest1 = Vote.where(id_tour: 1)
	  @resultst1 = Vote.where(id_tour: 1).group(:id_candidate).count.sort_by(&:last).reverse
	  @votest2 = Vote.where(id_tour: 2)
	  @resultst2 = Vote.where(id_tour: 2).group(:id_candidate).count.sort_by(&:last).reverse.first(2)
	  @candidates = Candidate.all
	  @votes = Vote.all


    if @votest1.update_all(vote_validation: 1)
  	  redirect_to admin_votes_path
    end
  end


  def validation2
  	 @votest2 = Vote.where(id_tour: 2)

      if @votest2.update_all(vote_validation: 1)
        redirect_to admin_votes_path
      end
  end

  def filter
  	@candidates = Candidate.all
  	@votes = Vote.where(code_postal: params[:search]).where(id_tour: params[:tour])
  	@count = @votes.count
  end

end
