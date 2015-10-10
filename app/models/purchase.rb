class Purchase < ActiveRecord::Base
  validates_presence_of :cost

  belongs_to :user
end