class MultipassController < ApplicationController

  def authenticate_store
    redirect_to login_path unless @current_user
    token = generate_multipass_token
    redirect_to (Figaro.env.MULTIPASS_URL + token)
  end

  private

  def generate_multipass_token
    customer_data = {
      email: @current_user.email,
      first_name: @current_user.first_name,
      last_name: @current_user.last_name
    }
    ShopifyMultipass.new.generate_token(customer_data)
  end

end
