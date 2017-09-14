class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
      email: params[:user][:email],
      password: params[:user][:password]
    )
    if @user.save
      flash[:notice] = "Successfully created user: #{@user.first_name}"
      session[:current_user_id] = @user.id
      @current_user = @user
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = 'Invalid user credentials!'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params.require(:user).permit(:email, :first_name, :last_name, :password))
    flash[:notice] = "User #{@user.first_name} updated!"
    redirect_to user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to 'http://www.shopify.com'
  end

end
