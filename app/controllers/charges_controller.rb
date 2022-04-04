class ChargesController < ApplicationController
  def create
    
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
    )
    
    charge = Stripe::PaymentIntent.create(
      :customer => customer.id,
      :amount => params[:amount],
      :description => 'Rails Stripe customer',
      :currency => 'usd',
      # payment_method_types: ['card'],
    )
    
    purchase = Purchase.create(email: params[:stripeEmail], description: charge.description, card: params[:stripeToken], currency: charge.currency, amount: params[:amount], customer_id: customer.id, product_id: 1, uuid: SecureRandom.uuid)
    
    redirect_to purchase

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end
  
end