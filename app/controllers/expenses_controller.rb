class ExpensesController < ActionController::Base

  def index
    @expense = Expense.new
  end

  def show
    @expense = Expense.find params[:id]
  end

end