class ExpensesController < ActionController::Base

  def index
    @expenses = Expense.all
  end

end