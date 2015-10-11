require 'rails_helper'

describe "Expenses" do
  let(:login_page) { LoginPageHelper.new }
  let(:user) { attributes_for(:user)}
  before :each do
    create(:user)
    login_page.visit_page.login(user)
  end

  describe 'User can create new expense' do
  end
end
