class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_user

  def load_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end

end
