require 'rails_helper'

describe 'create a new user' do
  let(:user_attr) { attributes_for(:user) }
  it 'should have a signup link' do
    visit root_path
    expect(page).to have_content('sign up')
  end

  it 'should have a sign up form' do
    visit root_path
    click_link 'sign up'
    expect(current_path).to eq new_user_path
  end
end