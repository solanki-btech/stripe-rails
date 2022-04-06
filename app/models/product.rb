class Product < ApplicationRecord

  scope :recent, -> { order(:desc) }
  
  def price_in_cents
    (self.price * 100).to_i
  end
end
