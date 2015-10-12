class Expense < ActiveRecord::Base
  validates_presence_of :amount
  validates_numericality_of :amount, :greater_than => 0

  belongs_to :user
  has_one :expense_type

  def self.total_expense_amount
    pluck(:amount).reduce(:+) || 0
  end

  def self.expense_sheet(data)
    data.map do |type, v|
      self.new(expense_type_id: type, amount: v)
    end
  end

  def self.snapshot(data, income)
    values = data.map { |d| d.amount}
    values.map { |v| ((v.to_f/income.to_f)* 100).floor }
  end
end