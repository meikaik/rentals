class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_user

  def load_user
    if session[:current_user_id]
      @current_user = User.find(session[:current_user_id])
    else
      @current_user = nil
    end
  end

end
