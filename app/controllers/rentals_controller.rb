class RentalsController < ApplicationController
  def new
    product = ShopifyAPI::Product.find(params[:product_id])
    @variants = product.variants
  end

end
