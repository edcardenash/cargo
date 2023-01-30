class CitiesController < ApplicationController
  def index
    cities = City.where(region_id: params[:region_id])
    @cities = policy_scope(cities)
    render json: @cities
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(cities_params)
    if @city.save
      redirect_to @city.index, notice: 'City was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def cities_params
    params.require(:city).permit(:name, :country_id)
  end
end
