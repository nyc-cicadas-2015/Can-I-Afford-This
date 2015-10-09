require 'rails_helper'

describe PurchasesController do
  before(:each) {
    session[:user_id] = user.id
  }
    let!(:user) { FactoryGirl.create :user }
    let!(:purchase) { FactoryGirl.create :purchase, :user_id => user.id }

  context "#index" do
    it "displays purchases" do
      get :index
      expect(response).to be_success
    end

    it "assigns @purchase to Purchase.new" do
      get :index
      expect(assigns(:purchase)).to be_a_new Purchase
    end
  end

end