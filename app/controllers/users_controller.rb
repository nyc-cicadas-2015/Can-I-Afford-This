class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @purchase = Purchase.new
    @user = User.find(params[:id])
    if !@user.income.nil? && !@user.expenses.empty?
      @income_to_expense_diff = (@user.income) - (@user.expenses.total_expense_amount)
    end
      # @payoff_time = (@user.purchases.find(params[:purchase_id].cost) / @income_to_expense_diff

      # if @payoff_time <= 12
      #   alert("YES! It will take you #{@payoff_time} months to save.")
      # else
      #   alert("No, you should hold off on this purchase")
      # end

  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:message] = "Success!"
      redirect_to root_path
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

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end