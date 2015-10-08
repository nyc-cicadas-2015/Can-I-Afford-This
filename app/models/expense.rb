class Expense < ActiveRecord::Base
  validates_presence_of :type
  validates_presence_of :amount

  belongs_to :user
end