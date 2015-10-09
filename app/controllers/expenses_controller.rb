class ExpensesController < ActionController::Base

  def index
    @expense = Expense.new
  end

  def show
    @expense = Expense.find params[:id]
  end

  def create
    find_user
    expense = @user.expenses.new(expenses_params)
    if expense.save
      redirect_to user_path(session[:user_id])
    else
      flash[:error] = "Your expense must be greater than $0."
      redirect_to user_path(session[:user_id])
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update_attributes expenses_params
      redirect_to user_path(session[:user_id])
    else
      flash[:error] = "Your expense must be greater than $0."
      redirect_to user_path(session[:user_id])
    end
  end

  private

  def find_user
    @user = User.find(session[:user_id])
  end

  def expenses_params
    params.require(:expense).permit(:expense_type, :amount)
  end
end