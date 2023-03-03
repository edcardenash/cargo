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
    @quotes = policy_scope(Quote)
  end

  def show
    @quote = Quote.find(params[:id])
    sdk = Mercadopago::SDK.new('TEST-5736802988968384-030220-ccf0ae0c9b225c5b313d600723b302d2-1299022241')
    preference_data = {
      back_urls: {
        success: 'http://cargoapp.me'
      },
      items: [
        {
          title: @quote.id,
          unit_price: @quote.amount,
          quantity: 1
        }
      ],
      notification_url: 'http://cargoapp.me'
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
