class VotesController < ApplicationController

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
    @results = Vote.group(:id_candidate).count
    @candidates = Candidate.all
  end

  # GET /votes/new
  def new
    is_logged
    @vote = Vote.new
  end

  # POST /votes
  # POST /votes.json
  def create
    is_logged
    @vote = Vote.new(vote_params)
    @user = current_user

    respond_to do |format|
      if @vote.save
        if @vote.id_tour == 1
          @user.tour1 = 1
          @vote.save
          @user.save
          format.html { redirect_to root_path, notice: 'Votre vote a été pris en compte' }
          format.json { render :show, status: :created, location: root_path }

        elsif @vote.id_tour == 2
          @user.tour2 = 1
          @vote.save
          @user.save
          format.html { redirect_to @vote, notice: 'Votre vote a été pris en compte' }
          format.json { render :show, status: :created, location: root_path }

        else
          format.html { render :new }
          format.json { render json: @vote.errors, status: :unprocessable_entity }
        end
      end

    end

  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vote
    @vote = Vote.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vote_params
    #params.require(:vote).permit(:id_candidate, :code_postal, :bureau_de_vote, :id_tour)
    params.require(:vote).permit(:id_candidate, :code_postal, :bureau_de_vote, :id_tour)
  end
end
