require 'rails_helper'

describe UsersController do
  describe 'GET#new' do
    it 'creates a new user' do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
  end

  describe "GET#show" do
    before(:each) {
      @user = create(:user)
    }
    it "Shows a specific user page" do
      get :show, id: @user.id
      expect(assigns(:user).id).to be(@user.id)
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
        post(:create, user: {name: nil, username: nil, password: nil })
        expect(response).to redirect_to login_path
      end

      it "sets a flash message welcoming the user" do
        post(:create, user: {name: nil, username: nil, password: nil })
        expect(flash[:error]).to have_content "email/password already exist"
      end
    end


  end


end
