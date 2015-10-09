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

    it 'logs me out' do
      click_link 'logout'
      expect(page).to have_content "You've been successfully logged out"
    end

    it 'has log in fields' do
      click_link 'logout'
      click_link 'login'

      expect(page).to have_field 'session_email'
      expect(page).to have_field 'session_password'
    end
  end
end