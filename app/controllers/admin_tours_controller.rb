class AdminToursController < ApplicationController
  before_action :set_admin_tour, only: [:show, :edit, :update, :destroy]

  # GET /admin_tours
  # GET /admin_tours.json
  def index
    @admin_tours = AdminTour.all
  end

  # GET /admin_tours/1
  # GET /admin_tours/1.json
  def show
  end

  # GET /admin_tours/new
  def new
    @admin_tour = AdminTour.new
  end

  # GET /admin_tours/1/edit
  def edit
  end

  # POST /admin_tours
  # POST /admin_tours.json
  def create
    @admin_tour = AdminTour.new(admin_tour_params)

    respond_to do |format|
      if @admin_tour.save
        format.html { redirect_to @admin_tour, notice: 'Admin tour was successfully created.' }
        format.json { render :show, status: :created, location: @admin_tour }
      else
        format.html { render :new }
        format.json { render json: @admin_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin_tours/1
  # PATCH/PUT /admin_tours/1.json
  def update
    respond_to do |format|
      if @admin_tour.update(admin_tour_params)
        format.html { redirect_to @admin_tour, notice: 'Admin tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_tour }
      else
        format.html { render :edit }
        format.json { render json: @admin_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_tours/1
  # DELETE /admin_tours/1.json
  def destroy
    @admin_tour.destroy
    respond_to do |format|
      format.html { redirect_to admin_tours_url, notice: 'Admin tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_tour
      @admin_tour = AdminTour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_tour_params
      params.require(:admin_tour).permit(:date_debut, :date_fin)
    end
end
