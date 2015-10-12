class PurchaseType < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :purchase

  def payoff_time
    if PurchaseType.name == 'small'
      payoff_time = 6
    elsif PurchaseType.name == 'medium'
      payoff_time = 12
    elsif PurchaseType.name == 'large'
      payoff_time = 60
    end
  end
end