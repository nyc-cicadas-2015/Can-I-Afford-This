class ExpensesController < ActionController::Base

  def index
    @expense = Expense.new
  end

end