class ExpensesController < ApplicationController
    before_action :find_user, only: [:new, :create]

  def index
    @expense = Expense.new
  end

  def new
    @expense = Expense.new
  end

  def show
    @expense = Expense.find params[:id]
    find_expense_type
  end

  def create
    Expense.expense_sheet(params)
    expense = @user.expenses.build(expenses_params)
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

  def find_expense_type
    @expense_type = ExpenseType.find(@expense.expense_type_id)
  end

  def expenses_params
    params.require(:expense).permit( :expense_type_id, :amount )
  end
end