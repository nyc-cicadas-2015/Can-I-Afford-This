class ExpenseType < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :expense


end