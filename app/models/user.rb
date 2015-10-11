class User < ActiveRecord::Base
  validates_presence_of :email, :unique => true
  validates_presence_of :name
  validates_presence_of :password, :length => {minimum: 6}, :on => :create

  has_secure_password

  has_many :expenses
  has_many :purchases
  has_many :savings

  def has_expense(expense_id)
    current_user
    where (:expense_type_id)
  end
end