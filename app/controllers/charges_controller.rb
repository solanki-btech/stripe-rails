class ChargesController < ApplicationController
  def create
    product = Product.find_by_sku("kittyOne")

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
    )
    
    charge = Stripe::PaymentIntent.create(
      :customer => customer.id,
      :amount => product.price_in_cents,
      :description => params[:description],
      :currency => 'usd',
    )
    
    purchase = Purchase.create(email: params[:stripeEmail], description: charge.description, card: params[:stripeToken], currency: charge.currency, amount: product.price_in_cents, customer_id: customer.id, product_id: product.id, uuid: SecureRandom.uuid)
    
    redirect_to purchase

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end
  
end