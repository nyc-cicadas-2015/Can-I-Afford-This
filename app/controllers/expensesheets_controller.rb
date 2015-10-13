class ExpensesheetsController < ApplicationController
    before_action :find_user, only: [:new, :create, :show, :update]

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
    @expenses = @user.expenses
  end

  def update
    Expense.expense_sheet(params[:expense][:amount]).each do |e|
      @user.expenses << e
      flash[:error] = "Oops! Someting went wrong." unless e.save
    end
    redirect_to user_path(session[:user_id])
  end

  private
  def find_user
    @user = User.find(session[:user_id])
  end

end