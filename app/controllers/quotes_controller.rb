class QuotesController < ApplicationController
  before_action :set_quote, only: [:edit, :update, :destroy]
  before_action :set_freight, only:[:new, :create]

  def index
    @quotes = policy_scope(Quote)
  end

  def new
    @quote = Quote.new
    authorize @quote
  end

  def create
    @quote = Quote.new(quote_params)
    authorize @quote
    @quote.freight = @freight
    @quote.user_id = current_user.id
    if @quote.save
      redirect_to freight_path(@freight), notice: 'Quote was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @quote
  end

  def update
    authorize @quote
    if @quote.update(quote_params)
      redirect_to freight_quotes_path, notice: 'Quote was successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @quote
    @quote.destroy
    redirect_to freights_path, notice: 'Quote was successfully destroyed'
  end

  private

  def quote_params
    params.require(:quote).permit(:amount, :comment, :vehicle_id, :freight_id, :user_id)
  end

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def set_freight
    @freight = Freight.find(params[:freight_id])
  end
end
