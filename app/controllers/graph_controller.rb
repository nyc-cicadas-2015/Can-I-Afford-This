class GraphController < ApplicationController

  def index
    @user = User.find(session[:user_id])
  end

  def data
    find_user
    @income = @user.income
    # I might make a "User.total_expenses" method instead of doing this work
    # in the controller.
    @user_expenses = @user.expenses.pluck(:amount).reduce(:+)
    respond_to do |format|
      format.json{
        # render :json => [{income: @income}, {expenses: @user_expenses}]
        render :json => [@income, @user_expenses]
      }
    end
  end

  def find_user
    @user = User.find(session[:user_id])
  end


end
