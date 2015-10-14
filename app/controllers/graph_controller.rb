class GraphController < ApplicationController
  def index
  end

  def net_savings_data
    @income = current_user.income
    @expenses = current_user.expensesheet_snapshot
    @user_expenses = current_user.total_expenses
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
    @expenses = current_user.total_percentages
    respond_to do |format|
      format.json{
        render json: { expenses: @expenses }
      }
    end
  end
end