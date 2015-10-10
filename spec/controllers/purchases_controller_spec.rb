require 'rails_helper'

describe PurchasesController do
  before(:each) {
    session[:user_id] = user.id
  }
    let!(:user) { FactoryGirl.create :user }
    let!(:purchase_type) { FactoryGirl.create :purchase_type }
    let!(:purchase) { FactoryGirl.create :purchase, :user_id => user.id, :purchase_type_id => purchase_type.id  }

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
    let(:new_purchase) { { purchase: attributes_for(:purchase, :user_id => user.id, :purchase_type_id => purchase_type.id) } }

    it "creates purchase with valid attributes" do
      expect {
        post(:create, new_purchase)
      }.to change {Purchase.count}
    end

    it "does not create with invalid attributes" do
      expect {
        post :create, purchase: {purchase_type_id: purchase_type.id, cost: nil }
      }.to_not change {Purchase.count}
    end
  end

  context "#edit" do
    it "is successful" do
      get :edit, :id => purchase.id
      expect(response).to be_success
    end
  end

  context "#update" do
    it "updates with valid attributes" do
      expect {
        put :update, :id => purchase.id, :purchase => { :cost => 100 }
      }.to change {purchase.reload.cost}.from(purchase.cost).to(100)
    end

    it "does not update with invalid attributes" do
      expect {
        put :update, :id => purchase.id, :purchase => { :cost => nil }
      }
    end
  end

  context "#destroy" do
    it "deletes the purchase" do
      expect{
        delete :destroy, :id => purchase.id
      }.to change {Purchase.count}.by(-1)
    end
  end

end