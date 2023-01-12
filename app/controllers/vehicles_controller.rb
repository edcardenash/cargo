class VehiclesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  def index
    @vehicle = policy_scope(Vehicle)
    if params[:query].present?
      @vehicles = Vehicle.global_search(params[:query])
    else
      @vehicles = Vehicle.all
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
    authorize @vehicle
  end

  def new
    @vehicle = Vehicle.new
    authorize @vehicle
    @regions = Region.all
    @cities = City.all
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    @vehicle.user_id = current_user.id
    authorize @vehicle
    @vehicle.city_id = params[:vehicle][:city_id][1]
    if @vehicle.save
      redirect_to new_vehicle_zone_path(@vehicle), notice: "Por favor continúa al siguiente paso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @vehicle
  end

  def update
    authorize @vehicle
  end

  def destroy
    authorize @vehicle
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:longitude, :latitude, :license_plate, :vehicle_type, :description, :covered, :load_capacity, :city_id, :other_regions, :other_cities, :user_id, :photo)
  end
end
