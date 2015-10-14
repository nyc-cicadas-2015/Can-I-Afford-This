class ExpensesheetsController < ApplicationController

  def new
    @expenses = Expense.new
  end

  def show
    @expenses = Expense.snapshot(@user.expenses, @user.income)
  end

  def create
    Expense.expense_sheet(params[:expense][:amount]).each do |e|
      @user.expenses << e
      flash[:error] = "Oops! Someting went wrong." unless e.save
    end
      redirect_to user_path(session[:user_id])
  end

  def edit
    @expenses = @user.expenses.includes(:expense_type).each_with_object({}) { |e, obj| obj[e.expense_type.name] = e }
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

  private
  def find_user
    @user = User.find(session[:user_id])
  end

end