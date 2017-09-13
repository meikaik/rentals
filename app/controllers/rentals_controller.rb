class RentalsController < ApplicationController
  def new
    @product = ShopifyAPI::Product.find(params[:product_id])
    @variants = @product.variants
  end

  def create
    Rental.create(
      user_id: @current_user.id,
      product_id: params["product_id"].to_i,
      variant_id: params["variant_id"].to_i,
      checkout_url: params["checkout_url"],
      start_date: Time.now,
      duration: params["duration"]
    )

    redirect_to params["checkout_url"]
  end

end
