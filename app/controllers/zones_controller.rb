class ZonesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  before_action :set_zone, only: [:show, :edit, :update, :destroy]

  def new
    @regions = Region.all
    @cities = City.all
    @zone = Zone.new
  end

  def create
    city_ids = params[:zone][:city_id]
    @vehicle = Vehicle.where(user_id: current_user.id).last
    city_ids.each do |city_id|
      @zone = Zone.new(city_id: city_id, vehicle_id: @vehicle.id)
      @zone.save
    end
    if @zone.save
      redirect_to root_path, notice: "Ciudades guardadas."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_zone
    @zone = Zone.find(params[:id])
  end

  # def zone_params
  #   params.require(:zone).permit(:city_id, :vehicle_id)
  # end
end
