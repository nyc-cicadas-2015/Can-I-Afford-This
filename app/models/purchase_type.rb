class PurchaseType < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :purchase
end