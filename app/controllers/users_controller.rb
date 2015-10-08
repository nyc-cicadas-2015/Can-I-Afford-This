class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect root_path
    else
      flash[:error] = "email/password already exist, please login"
      redirect_to '/login'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end