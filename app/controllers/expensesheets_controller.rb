class ExpensesheetsController < ApplicationController
  before_action :find_user, only: [:new, :create, :show]

  def new
    @expenses = Expense.new
  end

  def show
    # Yay I like this
    # @user.expense_snapshot might be a better location for storing this.
    @expenses = Expense.snapshot(@user.expenses, @user.income)
  end

  def create
    Expense.expense_sheet(params[:expense][:amount]).each do |e|
      # Not sure why you are making a new new expense here... your expense_sheet method
      # returns a Expense objects...

      # @user.expenses << e
      # flash[:error] = "Oops! Someting went wrong." unless e.save

      expense = @user.expenses.create(:amount => e.amount, :expense_type_id => e.expense_type_id)
      flash[:error] = "Oops! Someting went wrong." if !expense.save
    end
      redirect_to user_path(session[:user_id])
  end

  private

  # I'm seeing this method everywhere.  I would either move it into your applicationController,
  # or use your current_user method instead
  def find_user
    @user = User.find(session[:user_id])
  end

end
