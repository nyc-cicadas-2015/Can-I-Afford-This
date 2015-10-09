class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user.try(:authenticate, session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Incorrect username or password. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:message] = "You've been successfully logged out!"
    redirect_to root_path
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end

end