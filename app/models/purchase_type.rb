class PurchaseType < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :purchase

  def payoff_time
    payoff_time = \
      case self.name
      when "small" then 6
      when "medium" then 12
      else 60
      end
    end
  end

end