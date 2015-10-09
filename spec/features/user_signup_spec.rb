require 'rails_helper'

describe 'create a new user' do
  let(:user_attr) { attributes_for(:user) }
  it 'should have a signup link' do
    visit root_path
    expect(page).to have_content('sign up')
  end
end