class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]
  def index
    @quotes = Quote.all
    @quotes = policy_scope(Quote)
  end

  def show
    authorize @quote
  end

  def new
    @quote = Quote.new
    authorize @quote
  end

  def create
    @quote = Quote.new(quote_params)
    authorize @quote
    if @quote.save
      redirect_to quote_path(@quote), notice: 'Quote was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def editing
    authorize @quote
  end

  def update
    authorize @quote
    if @quote.update(quote_params)
      redirect_to @quote, notice: 'Quote was successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @quote
    @quote.destroy
    redirect_to quotes_url, notice: 'Quote was successfully destroyed'
  end

  private

  def quote_params
    params.require(:quote).permit(:status, :amount, :comment)
  end

  def set_quote
    @quote = Quote.find(params[:id])
  end
end
