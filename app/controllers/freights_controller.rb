class FreightsController < ApplicationController
  before_action :set_freight, only: [:show, :edit, :update, :destroy]

  def index
   @freights = policy_scope(Freight)
  end

  def show
    authorize @freight
    @quote = Quote.new
    @freight = Freight.find(params[:id])

    @markers = @freight.geocode.map do |freight|
      {
        lat: @freight.latitude,
        lng: @freight.longitude,
        end_lat: @freight.end_latitude,
        end_lng: @freight.end_logitude,
        info_window: render_to_string(partial: "shared/mapinfo", locals: { freight: @freight })
        # image_url: helpers.asset_url("logo.png")
      }
    end
  end

  def new
    @freight = Freight.new
    authorize @freight
  end

  def create
    @freight = Freight.new(freights_params)
    @freight.user = current_user
    authorize @freight
    @destiny_coordenates = @freight.destiny_address(params[:freight][:end_address])
    @freight.end_latitude = @destiny_coordenates.first.coordinates.first
    @freight.end_logitude = @destiny_coordenates.first.coordinates.last
    @freight.user_id = current_user.id
    if @freight.save
      redirect_to @freight, notice: 'Freight was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @freight
  end

  def update
    authorize @freight
    if @freight.update(freights_params)
      redirect_to @freight, notice: 'Freight has been updated'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @freight
    @freight.destroy
    redirect_to freight_url, notice: 'Freight has been deleted'
  end

  private

  def freights_params
    params.require(:freight).permit(:address, :description, :start_date, :receiver_name, :receiver_phone, :round_trip, :latitude, :longitude, :end_address, :end_latitude, :end_logitude)
  end

  def set_freight
    @freight = Freight.find(params[:id])
  end

end
