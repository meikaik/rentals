class MultipassController < ActionController::Base

  def authenticate_store
    redirect_to login_path unless session[:current_user_id]
    user = User.find(session[:current_user_id])
    token = generate_multipass_token(user)
    puts Figaro.env.MULTIPASS_URL + token
    redirect_to (Figaro.env.MULTIPASS_URL + token)
  end

  private

  def generate_multipass_token(user)
    customer_data = {
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name
    }
    ShopifyMultipass.new.generate_token(customer_data)
  end

end
