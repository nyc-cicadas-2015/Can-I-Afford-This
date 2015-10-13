require 'rails_helper'

describe "Savings" do
  let(:login_page) { LoginPageHelper.new }
  let(:user) { attributes_for(:user)}
  before :each do
    @user = create(:user)
    login_page.visit_page.login(user)
    click_link "Planned Purchases"
  end

  describe 'User can add a new saving amount' do
    it 'by visiting their planned purchases page' do
      visit userpurchases_path(@user.id)
      expect(page).to have_content("Saved")
    end

    it 'saves with valid attributes' do
      visit userpurchases_path(@user.id)
      click_link "Add savings"
      fill_in "saving_amount", :with => 200
      click_button "Add savings"
      expect(page).to have_content("Nice job! $200 added!")
    end

    it 'does not save with invalid attributes' do
      visit userpurchases_path(@user.id)
      click_link "Add savings"
      fill_in "saving_amount", :with => nil
      click_button "Add savings"
      expect(page).to have_content("Amount cannot be $0")
    end
  end
end
