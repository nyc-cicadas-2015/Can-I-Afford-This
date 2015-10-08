require 'rails_helper'

describe UsersController do
  describe 'GET#new' do
    it 'creates a new user' do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
  end
end
