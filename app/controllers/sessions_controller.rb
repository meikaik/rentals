class SessionsController < ApplicationController
  def new
    redirect_to user_path(session[:current_user_id]) if session[:current_user_id]
  end

  def create
    @user = User.find_by(email: params[:session][:email], password: params[:session][:password])
    if @user
      session[:current_user_id] = @user.id
      flash[:notice] = "Welcome back, #{@user.first_name}!"
      redirect_to user_path(@user.id)
    else
      flash[:alert] = 'Unsuccessful Login'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:current_user_id)
    flash[:notice] = 'Successfully logged out'
    redirect_to login_path
  end

end
