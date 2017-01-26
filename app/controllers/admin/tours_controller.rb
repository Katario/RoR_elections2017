class Admin::ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  # GET /tours
  # GET /tours.json
  def index
    is_admin_logged
    @tours = Tour.all
    if Tour.last.nil?
      @lastTour = 0
    else
      @lastTour = Tour.last.id
    end
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
    is_admin_logged
  end

  # GET /tours/new
  def new
    is_admin_logged
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
    is_admin_logged
  end

  # POST /tours
  # POST /tours.json
  def create
    is_admin_logged
    @tour = Tour.new(tour_params)

    respond_to do |format|
      if @tour.save
        format.html { redirect_to admin_tours_path, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: admin_tours_path }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    is_admin_logged
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to admin_tours_path, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_tours_path }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    is_admin_logged
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to admin_tours_path, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params.require(:tour).permit(:date_debut, :date_fin)
    end
end
