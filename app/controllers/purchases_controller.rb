require 'rails_helper'

describe PurchasesController do
  before(:each) {
    session[:user_id] = user.id
  }
    let!(:user) { FactoryGirl.create :user }
    let!(:purchase) { FactoryGirl.create :purchase, :user_id => user.id }


end