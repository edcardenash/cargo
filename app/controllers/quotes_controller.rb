class QuotesController < ApplicationController
  before_action :set_freight, only:[:new, :create]
  require 'mercadopago'

  def index
    if params[:query].present?
      @quotes = Quotes.all
      @quotes = policy_scope(@quotes.where("comment ILIKE ?", "%#{params[:query]}%"))
    else
      @quotes = policy_scope(Quote)
    end
    respond_to do |format|
      format.html
      format.text { render partial: "shared/list_quotes", locals: { quotes: @quotes }, formats: [:html] }
    end
  end

  def show
    @quote = Quote.find(params[:id])
    sdk = Mercadopago::SDK.new('APP_USR-5736802988968384-030220-a87e0c1562dec3f87250688dae500582-1299022241')
    preference_data = {
      items: [
        {
          title: @quote.id,
          unit_price: @quote.amount,
          quantity: 1
        }
      ]
    }
    preference_response = sdk.preference.create(preference_data)
    preference = preference_response[:response]
    @preference_id = preference['id']
    authorize @quote
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

  def destroy
    set_quote
    authorize @quote
    @quote.destroy
    redirect_to freights_path, notice: 'Tu cotización fue eliminada'
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
