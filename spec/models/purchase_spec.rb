require 'rails_helper'

describe Purchase do
  it 'is valid with a title, cost and purchase type id'
  it 'is invalid without a title'
  it 'is invalid without a cost'
  it 'is invalid without a purchase type id'
  it 'returns the total purchase amount'
  it 'returns the purchase type id'
  it 'returns the payoff time'
  it 'returns whether or not the user can afford this purchase'
end