class Purchase < ActiveRecord::Base
  validates_presence_of :cost
  validates_presence_of :title
  validates_numericality_of :cost, :greater_than => 0

  belongs_to :user
  belongs_to :purchase_type

  before_save :add_purchase_type_id

  def self.total_purchase_amount
    pluck(:cost).reduce(:+) || 0
  end

  def add_purchase_type_id
    self.purchase_type_id = \
      case cost.to_i
      when 0..1000 then 1
      when 1000..3000 then 2
      else 3
      end
  end

  def add_payoff_time
    payoff_time = \
      case self.purchase_type_id
      when 1 then 6
      when 2 then 12
      else 60
      end
  end

  def find_user_income
    # user_income = user_expenses = 0
    if !self.user.income.nil? && !self.user.expenses.empty?
      user_income = self.user.income
    end
  end

  def find_user_expense
    self.user.total_expenses
  end

  def user_income_to_expense_diff
    find_user_income - find_user_expense
  end

  def purchase_cost
    self.cost
  end

  def max_payoff_time
    self.add_payoff_time
  end

  def months_to_payoff
    (purchase_cost/user_income_to_expense_diff.to_f).ceil
  end

  def can_I_afford_this?
    return true if months_to_payoff <= max_payoff_time
  end

  def can_I_buy?
    self.user.total_savings >= purchase_cost
  end

  def self.snapshot(data)
    name = data.map{ |d| d.title }
    cost = data.map{ |d| d.cost }
    [name, cost].transpose.to_h
  end
end