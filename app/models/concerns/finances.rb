module Finances
  extend ActiveSupport::Concern


  def expensesheet_snapshot
    types = expenses.map { |d| ExpenseType.find(d.expense_type_id).name }
    values = expenses.map { |d| d.amount}
    percentages = values.map { |v| ((v.to_f/income.to_f)* 100).floor }
    [types, percentages].transpose.to_h
  end

  def total_percentages(data, income)
    percentages = expenses.map { |d| ((d.amount.to_f/income.to_f)* 100).floor }
  end

end

Expense.total_percentages(@user.expenses, @user.income)