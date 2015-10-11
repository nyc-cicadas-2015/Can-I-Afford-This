class ExpenseType < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :expense

  def amount_range(price)
    payoff_time = @payoff_time || 0
    if price(0..1000)
      ExpenseType.name = "small"
      payoff_time = 6
    elsif price(1001..2000)
      ExpenseType.name = "medium"
      payoff_time = 12
    elsif price >= 3001
      ExpenseType.name = "large"
      payoff_time = 60
    else
      nil
    end
  end

  def income_to_expense_diff(income, expense)
    income - expense
  end

end