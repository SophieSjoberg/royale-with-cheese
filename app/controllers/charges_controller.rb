class ChargesController < ApplicationController
  before_action :check_env
  def new
  end
  def create
    @amount = 1000
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: stripe_token(params)
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: '',
      currency: 'sek'
    )
<<<<<<< HEAD
    if charge.paid?
      message = "Thanks for your donation!"
    end
    redirect_to root_path, notice: message
=======

    if charge.paid?
      message = 'Your transaction was successful!'
    else
      redirect_to root_path
    end
      redirect_to root_path, notice: message
  end

  private
  def stripe_token(params)
    Rails.env.test? ? generate_test_token : params[:stripeToken]
  end

  def generate_test_token
    StripeMock.generate_card_token
  end

  def check_env
    StripeMock.start if Rails.env.test?
>>>>>>> fb18a54500c91dd5e53ac45314b88c13a7960885
  end
end
