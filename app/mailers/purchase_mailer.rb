class PurchaseMailer < ApplicationMailer
  layout 'purchase_mailer'
  default from: "Gunjan Solanki <gunjan.solanki@bacancy.com>"

  def purchase_receipt purchase
    @purchase = purchase
    mail to: purchase.email, subject: "Thanks for the purchase"
  end
  
end