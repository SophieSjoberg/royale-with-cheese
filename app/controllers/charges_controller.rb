class ChargesController < ApplicationController
  def create
    @amount = 1000
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Donate 10 sek',
      currency: 'sek'
    )
    if charge.paid?
      message = "Thanks for your donation!"
    end
    redirect_to root_path, notice: message
  end
end