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
      expect(page).to have_content("Add an expense")
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
