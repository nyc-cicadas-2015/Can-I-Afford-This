class SessionsController < ApplicationController

  def new
    user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Unable to find password & username combination. Please try again."
      redirect_to login_path
    end
  end

end