require 'rails_helper'

describe "Expenses" do
  let(:login_page) { LoginPageHelper.new }
  let(:user) { attributes_for(:user)}
  before :each do
    create(:user)
    login_page.visit_page.login(user)
  end

  describe 'User can create new expense' do
    it 'by visiting the expense page' do
      visit new_expense_path
      expect(page).to have_content("Enter your expenses")
    end

    it 'with valid attributes' do
      visit new_expense_path
      fill_in "__Housing", :with => 200
      click_button "Add Expenses"
      expect(page).to have_content(200)
    end

    it 'with valid attributes' do
      visit new_expense_path
      fill_in "__Housing", :with => nil
      click_button "Add Expenses"
      expect(page).to have_content("Your expense must be greater than $0.")
    end
  end
end
