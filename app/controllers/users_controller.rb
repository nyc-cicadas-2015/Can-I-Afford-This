class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    # @user = User.includes(expenses: [:expense_type]).find(params[:id])
    current_user || @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:message] = "Welcome #{user.name}!"
      redirect_to profile_path current_user
    else
      flash[:error] = "email/password already exist, please login"
      redirect_to '/login'
    end
  end

  def update
    @user = User.find(params[:id])
    if !@user.update_attributes(income: params[:income])
      flash[:error] = "Please enter a number!"
    end
      redirect_to user_path(session[:user_id])
  end

  def userpurchases
    @user = User.find(params[:id])
    @purchase = Purchase.new(user: current_user)
    @saving = Saving.new(user: current_user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end