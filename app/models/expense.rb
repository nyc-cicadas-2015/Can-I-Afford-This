class Expense < ActiveRecord::Base
  validates_presence_of :amount
  validates_numericality_of :amount, :greater_than => 0

  belongs_to :user
  belongs_to :expense_type

  def self.total_expense_amount
    pluck(:amount).reduce(:+) || 0
  end

  def self.expense_sheet(data)
    data.map do |type, v|
      self.new(expense_type_id: type, amount: v)
    end
  end

  def self.snapshot()
    types = expenses.map { |d| ExpenseType.find(d.expense_type_id).name }
    values = expenses.map { |d| d.amount}
    percentages = values.map { |v| ((v.to_f/income.to_f)* 100).floor }
    [types, percentages].transpose.to_h
  end

  def self.total_percentages(data, income)
    percentages = data.map { |d| ((d.amount.to_f/income.to_f)* 100).floor }
  end
end
