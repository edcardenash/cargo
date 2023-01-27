class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]

  def index
    @reviews = policy_scope(Review)
  end

  def create
    @review = Review.new(review_params)
    @vehicle = Vehicle.find(params[:vehicle_id])
    @review.vehicle_id = @vehicle.id
    @review.user_id = current_user.id
    @vehicle.quotes.each do |quote|
      if quote.freight.user_id == current_user.id
        @freights_ids = []
        @freights_ids << quote.freight_id
      end
    end
    @freight = Freight.find(@freights_ids.last)
    @review.quote_id = @freight.quotes.last.id
    if @review.save
      redirect_to vehicle_path(@vehicle), notice: 'Review was successfully created.'
    else
      redirect_to root_path, status: :unprocessable_entity
    end
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:rating, :quote_id, :user_id, :vehicle_id, :comment)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
