class GraphController < ApplicationController

  def index
    @user = User.find(session[:user_id])
  end

  def net_savings_data
    find_user
    @income = @user.income
    @expenses = Expense.snapshot(@user.expenses, @user.income)
    @user_expenses = @user.expenses.pluck(:amount).reduce(:+)
    respond_to do |format|
      format.json{
        render json: { income: @income, expenses: @user_expenses, percentages: @expenses }
      }
    end
  end

  def savings_vs_purchase_data
    find_user
    @savings = @user.income
    @user_expenses = @user.expenses.pluck(:amount).reduce(:+)
    respond_to do |format|
      format.json{
        render json: { income: @income, expenses: @user_expenses }
      }
    end
  end

  def find_user
    @user = User.find(session[:user_id])
  end


end