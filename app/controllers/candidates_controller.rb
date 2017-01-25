class CandidatesController < ApplicationController
  def index
    is_logged
    @candidates = Candidate.all
  end
  def show
    is_logged
    @candidate = Candidate.find(params[:id])
  end

end
