class ExpensesheetsController < ApplicationController

  def new
    @expenses = Expense.new
  end

  def show
    @expenses = current_user.expensesheet_snapshot
  end

  def create
    Expense.expense_sheet(params[:expense][:amount]).each do |e|
      current_user.expenses << e
      flash[:error] = "Oops! Someting went wrong." unless e.save
    end
      redirect_to user_path(session[:user_id])
  end

  def edit
    @expenses = current_user.expenses.includes(:expense_type).each_with_object({}) { |e, obj| obj[e.expense_type.name] = e }
  end

  def update
    current_user.expenses.each do |e|
      params[:expense].each do |k, v|
        if e.expense_type.name == k
          e.update_attribute(:amount, v)
        end
      end
    end
    redirect_to user_path(session[:user_id])
  end
end