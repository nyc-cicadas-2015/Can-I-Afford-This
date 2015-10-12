class ExpensesheetsController < ApplicationController
    before_action :find_user, only: [:new, :create, :show]

  def new
    @expenses = Expense.new
  end

  def show
    @types = ExpenseType.all
    @expenses = Expense.snapshot(@user.expenses, @user.income)
  end

  def create
    Expense.expense_sheet(params[:expense][:amount]).each do |e|
      expense = @user.expenses.create(:amount => e.amount, :expense_type_id => e.expense_type_id)
      flash[:error] = "Oops! Someting went wrong." if !expense.save
    end
      redirect_to user_path(session[:user_id])
  end

  private

  def find_user
    @user = User.find(session[:user_id])
  end

end