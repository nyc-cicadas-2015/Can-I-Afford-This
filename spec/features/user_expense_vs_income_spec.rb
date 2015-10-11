require 'rails_helper'

describe "User Profile page" do
  let(:login_page) { LoginPageHelper.new }
  let(:user) { attributes_for(:user)}
  before :each do
    create(:user)
    login_page.visit_page.login(user)
  end

  describe 'User can compare how their expense vs income stack up' do
  end
end
