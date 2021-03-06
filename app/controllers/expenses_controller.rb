class ExpensesController < ApplicationController
  def index
    @expense = current_user.expenses.new
  end

  def new
    @expense = current_user.expenses.new
  end

  def show
    @expense = current_user.expenses.find params[:id]
    @expense_type = ExpenseType.find(@expense.expense_type_id)
  end

  def create
    expense = current_user.expenses.build(expenses_params)
    if !expense.save
      flash[:error] = "Your expense must be greater than $0."
    end
      redirect_to user_path(current_user)
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
  def expenses_params
    params.require(:expense).permit( :expense_type_id, :amount )
  end
end