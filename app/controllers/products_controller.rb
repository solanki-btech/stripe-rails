class ProductsController < ApplicationController
  def index
    @products = Product.recent
  end

  def show
    @product = Product.find(params[:id])    
  end
end