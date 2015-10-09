require 'rails_helper'

describe SessionsController do
  describe "GET #new" do
    it "Creates a new session" do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
  end

  describe "POST #create" do
    describe "When Successful" do
      let(:user_params) { { user: attributes_for(:user) } }

      it "Creates a user" do
        post(:create, user_params)
        expect(response).to redirect_to root_path
      end

      it "Increased number of users in the database by 1" do
        expect{post(:create, user_params)}.to change{User.count}.by(1)
      end
    end

    describe "When Unsuccessful" do
      it "redirects to login" do
        post(:create, user: {name: nil, email: nil, password: nil })
        expect(response).to redirect_to login_path
      end

      it "sets a flash error" do
        post(:create, user: {name: nil, email: nil, password: nil })
        expect(flash[:alert]).to have_content "Unable to find password & username combination"
      end

    end

  end



end
