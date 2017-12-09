class ChargesController < ApplicationController
  def new
  end
  def create
    @amount = 1000
    binding.pry
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
    binding.pry
    if charge.paid?
        # current_user.update_attribute(:customer, true)
        message = 'message!'
      else
        message = 'error!'
      end
      redirect_to root_path, notice: message
    end

end
