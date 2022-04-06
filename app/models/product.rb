class Product < ApplicationRecord

  scope :recent, -> { order(created_at: :desc) }
  
  def price_in_cents
    (self.price * 100).to_i
  end
end
