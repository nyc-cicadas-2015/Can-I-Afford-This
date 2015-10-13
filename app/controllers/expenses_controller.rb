class ExpensesController < ApplicationController
  def index
    @expense = Expense.new
  end

  def new
    @expense = Expense.new
  end

  def show
    @expense = Expense.find params[:id]
    @expense.expense_type
  end

  def create
    expense = @user.expenses.build(expenses_params)
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