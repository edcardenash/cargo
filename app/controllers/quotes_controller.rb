class QuotesController < ApplicationController
  before_action :set_freight, only:[:new, :create]

  def index

    if params[:query].present?
      @quotes = Quotes.all
      @quotes = policy_scope(@quotes.where("comment ILIKE ?", "%#{params[:query]}%"))
    else
      @quotes = policy_scope(Quote)
    end

    respond_to do |format|
      format.html
      format.text { render partial: "shared/list_quotes", locals: {quotes: @quotes}, formats: [:html] }
    end

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
      redirect_to freight_path(@freight), notice: 'Tu cotización fue creada exitosamente'
    else
      render :new, status: :unprocessable_entity
    end
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
