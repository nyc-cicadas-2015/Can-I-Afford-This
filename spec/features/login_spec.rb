require 'rails_helper'

describe 'the login/logout process' do
  let(:login_page) { LoginPageHelper.new }
  let(:user) { attributes_for(:user)}
  before :each do
    create(:user)
    login_page.visit_page_login(user)
  end



end