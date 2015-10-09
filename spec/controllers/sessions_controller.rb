require 'rails_helper'

describe SessionsController do
  describe "GET #new" do
    it "Creates a new session" do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
  end

  describe "GET #create" do
    describe 'when successful' do
      before(:each) { @user = create(:user) }
      it "assigns the correct user id" do
        get :show, id: @user.id
        expect(assigns(:user).id).to be(@user.id)
      end
    end
  end



end
