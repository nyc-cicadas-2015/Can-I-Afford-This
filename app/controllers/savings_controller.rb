class SavingsController < ApplicationController
  before_action :find_user, only: [:new, :create]

  def new
    @saving = Saving.new
  end

  def create
    saving = @user.savings.build(saving_params)
    saving.save ? flash[:message] = "Nice job! $#{saving.amount} added!" : flash[:error] = "Amount cannot be $0"
    redirect_to profile_path(session[:user_id])
  end

private
  def saving_params
    params.require(:saving).permit(:amount)
  end

  def find_user
    @user = User.find(session[:user_id])
  end
end