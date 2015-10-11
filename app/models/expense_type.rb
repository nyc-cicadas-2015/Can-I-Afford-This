class ExpenseType < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :expense

  def amount_range(price)
    if price(0..1000)
      ExpenseType.name = "small"
    elsif price(1001..2000)
      ExpenseType.name = "medium"
    elsif price >= 3001
      ExpenseType.name = "large"
    else
      nil
    end
  end


end