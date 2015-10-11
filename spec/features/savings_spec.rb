require 'rails_helper'

describe "Savings" do
  let(:login_page) { LoginPageHelper.new }
  let(:user) { attributes_for(:user)}
  before :each do
    @user = create(:user)
    login_page.visit_page.login(user)
  end

  describe 'User can add a new saving amount' do
    it 'by visiting their profile page' do
      visit profile_path(@user.id)
      expect(page).to have_content("Saved")
    end

    it 'saves with valid attributes' do
      visit profile_path(@user.id)
      click_button "Add savings"
      fill_in "saving_amount", :with => 200
      click_button "Add savings"
      expect(page).to have_content(200)
    end

    it 'does not save with invalid attributes' do
      visit profile_path(@user.id)
      click_button "Add savings"
      fill_in "saving_amount", :with => nil
      click_button "Add savings"
      expect(page).to have_content("Amount cannot be $0")
    end
  end
end
