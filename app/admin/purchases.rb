ActiveAdmin.register Purchase do

  before_action do 
    Purchase.class_eval do
      def to_param
        id.to_s
      end
    end
  end
  # permit_params :email, :amount, :description, :currency, :customer_id, :card, :product_id, :uuid


  show do
    attributes_table do
      row :email
      row :amount
      row :description
      row :currency
      row :customer_id
      row :card
      row :product_id
      row :uuid
    end
  end
  
end
