require 'rails_helper'

describe "Savings" do
  let(:login_page) { LoginPageHelper.new }
  let(:user) { attributes_for(:user)}
  before :each do
    @user = create(:user)
    login_page.visit_page.login(user)
  end

  describe 'User can add a new saving' do
    it 'by visiting their profile page' do
      visit profile_path(@user.id)
      expect(page).to have_content("Add savings")
    end

  end
end
