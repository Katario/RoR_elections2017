class Admin::VotesController < ApplicationController

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

end
