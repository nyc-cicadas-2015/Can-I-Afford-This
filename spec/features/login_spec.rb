require 'rails_helper'

describe 'the login/logout process' do
  let(:login_page) { LoginPageHelper.new }
  let(:user) { attributes_for(:user)}
  before :each do
    create(:user)
    login_page.visit_page.login(user)
  end

  describe 'when logged in' do
    it 'signs me in' do
      expect(page).to have_content "Welcome #{user[:name]}"
    end
  end

  describe 'when logged in' do
    it 'has a logout link' do
      expect(page).to have_link 'logout'
    end


  end



end