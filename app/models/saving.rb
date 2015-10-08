class Saving < ActiveRecord::Base
  validates_presence_of :amount

  belongs_to :user
end