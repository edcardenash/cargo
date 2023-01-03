class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]
  def index
    @quotes = Quote.all
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to quote_path(@quote), notice: 'Quote was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def editing
  end

  def update
    if @quote.update(quote_params)
      redirect_to @quote, notice: 'Quote was successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
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
