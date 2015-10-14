class PurchaseType < ActiveRecord::Base
  validates_presence_of :name
  has_many :purchases
end