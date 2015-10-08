class Expense < ActiveRecord::Base
  validates_presence_of :expense_type
  validates_presence_of :amount

  belongs_to :user
end