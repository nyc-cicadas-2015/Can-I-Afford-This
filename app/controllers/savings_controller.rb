class SavingsController < ApplicationController

  def new
    @saving = Saving.new
  end

  def create
    user = User.find(session[:user_id])
    saving = user.savings.build(saving_params)
    flash[:error] = "Amount cannot be $0" if !saving.save
    redirect_to root_path
  end

private
  def saving_params
    params.require(:saving).permit(:amount)
  end
end