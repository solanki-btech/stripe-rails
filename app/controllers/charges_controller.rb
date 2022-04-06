class ChargesController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source => params[:stripeToken],
      :plan => "price_1KlVupSHpVmrK6UdT1IidR5d"
    )
    
    # charge = Stripe::PaymentIntent.create(
    #   :customer => customer.id,
    #   :amount => product.price_in_cents,
    #   :description => params[:description],
    #   :currency => 'usd',
    # )
    
    purchase = Purchase.create(email: params[:stripeEmail], description: product.description, card: params[:stripeToken], currency: "usd", amount: product.price_in_cents, customer_id: customer.id, product_id: product.id, uuid: SecureRandom.uuid)
    
    redirect_to purchase

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end
  
end