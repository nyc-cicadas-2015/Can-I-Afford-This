require 'rails_helper'

describe "User Profile page" do
  let(:login_page) { LoginPageHelper.new }
  let(:user) { attributes_for(:user)}
  before :each do
    create(:user)
    login_page.visit_page.login(user)
  end

  describe 'User can compare how their expense vs income stack up' do
    it 'shows user their total monthly expenses' do
      visit user_path(session[:user_id])
      expect(page).to have_content("Enter your expenses")
    end

    it 'with valid attributes' do
      visit new_expense_path
      fill_in "expense_amount", :with => 200
      click_button "Add Expense"
      expect(page).to have_content(200)
    end

    it 'with valid attributes' do
      visit new_expense_path
      fill_in "expense_amount", :with => nil
      click_button "Add Expense"
      expect(page).to have_content("Your expense must be greater than $0.")
    end
  end
end
