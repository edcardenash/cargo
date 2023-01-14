class FreightsController < ApplicationController
  before_action :set_freight, only: [:show, :edit, :update, :destroy]

  def index
   @freights = policy_scope(Freight)
  end

  def show
    @quote = Quote.new
    @markers = @freight.geocode.map do |freight|
      {
        start_latitude: @freight.start_latitude,
        start_longitude: @freight.start_longitude,
        end_latitude: @freight.end_latitude,
        end_longitude: @freight.end_longitude,
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

  def create
    @freight = Freight.new(freights_params)
    authorize @freight
    if @freight.save
      redirect_to freight_path(@freight), notice: 'Freight was successfully created'
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
    params.require(:freight).permit(:start_latitude, :start_longitude, :end_latitude, :end_longitude, :description, :start_date, :receiver_name, :receiver_phone, :round_trip)
  end

  def set_freight
    @freight = Freight.find(params[:id])
  end

end
