class ExpensesController < ApplicationController

  def index
    @expense = Expense.new
  end

  def new
    find_user
    @expense = Expense.new
  end

  def show
    @expense = Expense.find params[:id]
  end

  def create
    find_user
    expense = @user.expenses.new(expenses_params)
    if !expense.save
      flash[:error] = "Your expense must be greater than $0."
    end
      redirect_to new_expense_path
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    if !@expense.update_attributes expenses_params
      flash[:error] = "Your expense must be greater than $0."
    end
      redirect_to user_path(session[:user_id])
  end

  private

  def find_user
    @user = User.find(session[:user_id])
  end

  def expenses_params
    params.require(:expense).permit(:amount, :expense_type_id)
  end
end