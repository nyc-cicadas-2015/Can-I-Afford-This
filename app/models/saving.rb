class Saving < ActiveRecord::Base
  validates_presence_of :amount
  validates_numericality_of :amount, :greater_than => 0

  belongs_to :user

  def self.total_savings
    pluck(:amount).reduce(:+) || 0
  end

end