require 'rails_helper'

describe ExpensesController do
  before(:each) {
    let!(:user) { FactoryGirl.create :user }
    let!(:expense) { FactoryGirl.create :expense, :user_id => user.id }
    session[:user_id] = user.id
  }

  context "#index" do
    it "displays expenses" do
      get :index
      expect(response).to render_template :index
    end

  end
end