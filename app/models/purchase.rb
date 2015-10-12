class Purchase < ActiveRecord::Base
  validates_presence_of :cost
  validates_presence_of :title
  validates_numericality_of :cost, :greater_than => 0

  belongs_to :user
  has_one :purchase_type

  def self.total_purchase_amount
    pluck(:cost).reduce(:+) || 0
  end

  def amount_range(price)
    if price(0..1000)
      PurchaseType.name = "small"
      payoff_time = 6
    elsif price(1001..3000)
      PurchaseType.name = "medium"
      payoff_time = 12
    elsif price >= 3001
      PurchaseType.name = "large"
      payoff_time = 60
    else
      nil
    end
  end



end