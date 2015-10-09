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

  context "#show" do
    it "is successful" do
      get :show, :id => purchase.id
      expect(response).to be_success
    end

    it "shows the correct purchase" do
      get :show, :id => purchase.id
      expect(assigns(:purchase)).to eq purchase
    end
  end

  context "#create" do
    let(:new_purchase) { { purchase: attributes_for(:purchase, :user_id => user.id) } }

    it "creates purchase with valid attributes" do
      expect {
        post(:create, new_purchase)
      }.to change {Purchase.count}
    end

    it "does not create with invalid attributes" do
      expect {
        post :create, purchase: {category: nil, cost: nil }
      }.to_not change {Purchase.count}
    end
  end

end