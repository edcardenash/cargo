class VehiclesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  def index
    @vehicles = policy_scope(Vehicle.global_search(params[:query])) if params[:query].present?
    @vehicles ||= policy_scope(Vehicle)

    respond_to do |format|
      format.html
      format.text { render partial: "shared/list_vehicles", locals: { vehicles: @vehicles }, formats: [:html] }
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
    @review = Review.new
    quotes = @vehicle.quotes
    if quotes.any?
      @freights = quotes.map { |quote| Freight.find(quote.freight_id) }
    end
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
    @vehicle.assign_attributes(user: current_user, user_id: current_user.id, rating: 5.0)
    authorize @vehicle
    if @vehicle.save
      redirect_to @vehicle, notice: "Vehículo agregado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @vehicle
  end

  def update
    authorize @vehicle
    if @vehicle.update(vehicle_params)
      redirect_to @vehicle, notice: 'El vehículo se ha actualizado exitosamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @vehicle
    @vehicle.destroy
    redirect_to root_path, notice: 'El vehículo se ha eliminado exitosamente.'
  end

  def my_vehicles
    @vehicles = current_user.vehicles
    authorize @vehicles
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:longitude, :latitude, :license_plate, :vehicle_type, :description, :covered, :load_capacity, :city_id, :other_regions, :other_cities, :user_id, :alias, :photo)
  end
end
