class Purchase < ActiveRecord::Base
  validates_presence_of :cost
  validates_presence_of :title
  validates_numericality_of :cost, :greater_than => 0

  belongs_to :user
  has_one :purchase_type

  before_save :add_purchase_type

  def self.total_purchase_amount
    pluck(:cost).reduce(:+) || 0
  end

  def self.add_purchase_type(cost)
    num_cost = cost.to_i
    return 1 if num_cost > 0 && num_cost <= 1000
    return 2 if num_cost >= 1001 && num_cost <= 3000
    return 3 if num_cost >= 3001
  end
end