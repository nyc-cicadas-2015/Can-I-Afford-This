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

  def add_purchase_type
    if purchase.cost(0..1000)
      PurchaseType.name = "small"
    elsif purchase.cost(1001..3000)
      PurchaseType.name = "medium"
    elsif purchase.cost >= 3001
      PurchaseType.name = "large"
    else
      nil
    end
  end

end