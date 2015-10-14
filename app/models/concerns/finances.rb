module Finances
  extend ActiveSupport::Concern


  def total_expenses
    types = expenses.map { |d| ExpenseType.find(d.expense_type_id).name }
    values = expenses.map { |d| d.amount}
    percentages = values.map { |v| ((v.to_f/income.to_f)* 100).floor }
    [types, percentages].transpose.to_h
  end

end
