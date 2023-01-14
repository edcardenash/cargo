class FreightsController < ApplicationController
  before_action :set_freight, only: [:show, :edit, :update, :destroy]

  def index
   @freights = policy_scope(Freight)
  end

  def show
    @quote = Quote.new
    @freight = Parking.find(params[:id])
    @markers = @freight.geocode.map do |freight|
      {
        start_address: @freight.start_latitude,
        end_address: @freight.start_longitude,
        info_window: render_to_string(partial: "info_window", locals: { freight: @freight })
      }
    end
    @freight = Freight.find(params[:id])
    authorize @freight
  end

  def new
    @freight = Freight.new
    authorize @freight
  end

  def vehicle_request
    # to do
  end

  def create
    @freight = Freight.new(freights_params)
    @freight.user = current_user
    authorize @freight
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
    params.require(:freight).permit(:start_address, :end_address, :description, :start_date, :receiver_name, :receiver_phone, :round_trip)
  end

  def set_freight
    @freight = Freight.find(params[:id])
  end

end
