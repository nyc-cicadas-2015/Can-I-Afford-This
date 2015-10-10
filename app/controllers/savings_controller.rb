class SavingsController < ApplicationController

  def new
    @saving = Saving.new
  end

  def create
    @user = User.find(session[:user_id])
    saving = @user.savings.build(saving_params)
    saving.save ? flash[:message] = "$#{saving.amount} added!" : flash[:error] = "Amount cannot be $0"
    redirect_to profile_path(session[:user_id])
  end

private
  def saving_params
    params.require(:saving).permit(:amount)
  end
end