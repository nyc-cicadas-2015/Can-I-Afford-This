class Purchase < ActiveRecord::Base
  validates_presence_of :cost
  validates_presence_of :title
  validates_numericality_of :cost, :greater_than => 0

  belongs_to :user
  has_one :purchase_type

  before_save :add_purchase_type_id

  def self.total_purchase_amount
    pluck(:cost).reduce(:+) || 0
  end

  def add_purchase_type_id
    self.purchase_type_id = \
      case cost.to_i
      when [0 .. 1000] then 1
      when [1000 .. 3000] then 2
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

  def can_I_afford_this
    income = self.user.income
    purchase_price =
  end

end