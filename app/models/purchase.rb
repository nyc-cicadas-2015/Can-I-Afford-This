class Purchase < ActiveRecord::Base
  validates_presence_of :cost
  validates_presence_of :title
  validates_numericality_of :cost, :greater_than => 0

  belongs_to :user
  has_one :purchase_type

  def self.total_purchase_amount
    pluck(:cost).reduce(:+) || 0
  end
end