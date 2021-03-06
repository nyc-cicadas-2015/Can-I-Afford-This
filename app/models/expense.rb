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
end
