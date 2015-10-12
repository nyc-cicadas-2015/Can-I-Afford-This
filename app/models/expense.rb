class Expense < ActiveRecord::Base
  validates_presence_of :amount
  validates_numericality_of :amount, :greater_than => 0

  belongs_to :user
  has_one :expense_type

  def self.total_expense_amount
    pluck(:amount).reduce(:+) || 0
  end

  def self.expense_sheet(data)
    byebug
  end
end