require 'rails_helper'

describe SessionsController do
  describe "GET #new" do
    it "Creates a new session" do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
  end



end
