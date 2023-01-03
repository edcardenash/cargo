class FreightsController < ApplicationController
  before_action :set_freight, only: [:show, :edit, :update, :destroy]

  def index
    @freights = Freight.all
  end

  def show
  end

  def new
    @freights = Freight.new
  end

  def create
    @freight = Freight.new(freights_params)
    if @freight.save
      redirect_to freight_path(@freight), notice: 'Freight was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @freight.update(freights_params)
      redirect_to @freight, notice: 'Freight has been updated'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @freight.destroy
    redirect_to freight_url, notice: 'Freight has been deleted'
  end

  private

  def freights_params
    params.require(:freight).permit(:start_latitude, :start_longitude, :end_latitude, :end_longitude, :description, :start_date, :receiver_name, :receiver_phone, :round_trip)
  end

  def set_freight
    @freight = Freight.find_by_id(params[:id])
  end
end
