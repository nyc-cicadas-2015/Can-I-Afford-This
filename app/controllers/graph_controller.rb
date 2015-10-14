class GraphController < ApplicationController
  before_action :find_user

  def index
  end

  def net_savings_data
    @income = @user.income
    @expenses = current_user.expensesheet_snapshot
    @user_expenses = @user.total_expenses
    respond_to do |format|
      format.json{
        render json: { income: @income, expenses: @user_expenses, percentages: @expenses }
      }
    end
  end

  def savings_vs_purchase_data
    @savings = current_user.total_savings
    @purchases_cost = current_user.purchases_cost
    @purchases_name = current_user.purchases_name
    respond_to do |format|
      format.json{
        render json: { savings: @savings, p_cost: @purchases_cost, p_name: @purchases_name }
      }
    end
  end

  def expense_percentages_data
    @expenses = Expense.total_percentages(@user.expenses, @user.income)
    respond_to do |format|
      format.json{
        render json: { expenses: @expenses }
      }
    end
  end

  private
  def find_user
    @user = User.find(session[:user_id])
  end

end