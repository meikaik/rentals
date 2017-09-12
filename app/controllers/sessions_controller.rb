class SessionsController < ApplicationController
  def new
    redirect_to session[:current_user_id] if session[:current_user_id]
  end

  def create
    @user = User.find_by(email: params[:session][:email], password: params[:session][:password])
    if @user
      session[:current_user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete[:current_user_id]
    redirect_to login_path
  end

end
