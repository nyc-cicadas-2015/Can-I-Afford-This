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
      redirect_to root_path
    else
      render :partial => 'errors', flash: { error: "Your expense must be greater than $0."}
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  private

  def find_user
    @user = User.find(session[:user_id])
  end

  def expenses_params
    params.require(:expense).permit(:expense_type, :amount)
  end
end