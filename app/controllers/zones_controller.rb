class ZonesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  before_action :set_zone, only: [:show, :edit, :update, :destroy]

  def new
    @regions = Region.all
    @cities = City.all
    @zone = Zone.new
  end

  def show
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def create
    (params[:zone][:city_id]).each do |city_id|
      @zone = Zone.new(city_id: city_id, vehicle_id: params[:vehicle_id])
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
end
