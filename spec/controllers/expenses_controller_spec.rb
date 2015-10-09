require 'rails_helper'

describe ExpensesController do
  before(:each) {
    session[:user_id] = user.id
  }
    let!(:user) { FactoryGirl.create :user }
    let!(:expense) { FactoryGirl.create :expense, :user_id => user.id }

  context "#index" do
    it "displays expenses" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns @expense to Expense.new" do
      get :index
      expect(assigns(:expense)).to be_a_new Expense
    end
  end

  context "#show" do
    it "is successful" do
      get :show, :id => expense.id
      expect(response).to be_success
    end

    it "shows the correct expense" do
      get :show, :id => expense.id
      expect(assigns(:expense)).to eq expense
    end
  end

  context "#create" do
    let(:new_expense) { { expense: attributes_for(:expense, :user_id => user.id) } }

    it "creates expense with valid attributes" do
      expect {
        post(:create, new_expense)
      }.to change {Expense.count}
    end

    it "does not create with invalid attributes" do
      expect {
        post :create, expense: {expense_type: nil, amount: nil }
      }.to_not change {Expense.count}
    end
  end

  context "#edit" do
    it "is successful" do
      get :edit, :id => expense.id
      expect(response).to be_success
    end
  end

  context "#update" do
    it "updates with valid attributes" do
      expect {
        put :update, :id => expense.id, :expense => { :amount => 100 }
      }.to change {expense.reload.amount}.from(expense.amount).to(100)
    end

    it "does not update with invalid attributes" do
      expect {
        put :update, :id => expense.id, :expense => { :amount => nil }
      }
    end
  end

end