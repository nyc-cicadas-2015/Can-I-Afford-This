class Expense < ActiveRecord::Base
  validates_presence_of :amount
  validates_numericality_of :amount, :greater_than => 0

  belongs_to :user
  belongs_to :expense_type

  def self.total_expense_amount
    # How can this work?  This is a class method, there is no "amount"??
    # I think this will work on all the expenses in the db:
    #
    # >> Expense.total_expense_amount
    # (0.4ms)  SELECT "expenses"."amount" FROM "expenses"
    # => 0
    pluck(:amount).reduce(:+) || 0
  end

  def self.expense_sheet(data)
    data.map do |type, v|
      self.new(expense_type_id: type, amount: v)
    end
  end

  def self.snapshot(data, income)
    # I have no idea what this code is doing.  Can you comment on each line
    # and explain?  Any time code is not readily apparent in purpose, you may
    # want to alert the reader as to its reason for existence.
    types = data.map { |d| ExpenseType.find(d.expense_type_id).name}
    values = data.map { |d| d.amount}
    percentages = values.map { |v| ((v.to_f/income.to_f)* 100).floor }
    [types, percentages].transpose.to_h
  end
end
