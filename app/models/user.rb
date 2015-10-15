class User < ActiveRecord::Base
  validates_presence_of :email, :unique => true
  validates_presence_of :name
  validates_presence_of :password, :length => {minimum: 6}, :on => :create

  has_secure_password

  has_many :expenses
  has_many :purchases
  has_many :savings

  include Finances

  def total_expenses
    expenses.sum(:amount)
  end

  def total_savings
    savings.sum(:amount)
  end

  def total_purchase_amount
    purchases.sum(:cost)
  end

  def can_make_purchase?
    self.has_income? && self.income >= self.total_expenses
  end

  def has_income?
    !income.nil?
  end

  def has_expenses?
    !expenses.empty?
  end

  def purchases_cost
    purchases.map { |p| p.cost }
  end

  def purchases_name
    purchases.map { |p| p.title }
  end

  def arr_of_expense_names
    expenses.map { |e| e.expense_type.name }
  end

  def arr_of_expense_amounts
    expenses.map { |e| e.amount }
  end

end