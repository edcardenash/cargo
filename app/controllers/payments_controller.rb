class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
    authorize @payment
  end

  def create
    @payment = Payment.new(payment_params)
    raise

    if @payment.valid?
      # process the payment
      redirect_to freights_path
    else
      render :new
    end
    authorize @payment
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :card_number, :expiration_date, :ccv)
  end
end
