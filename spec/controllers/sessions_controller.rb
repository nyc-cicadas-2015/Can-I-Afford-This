require 'rails_helper'

describe SessionsController do
  describe "GET #new" do
    it "Creates a new session" do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
  end

  describe "GET #create" do
    describe "when successful" do
      before(:each){
        @user = create(:user)
        post :create, session: {
          email: user[:email],
          password: user[:password]
        }
      }
      let(:user) { attributes_for(:user)}

      it 'returns http success' do
        expect(response).to redirect_to root_path
      end

      it 'sets the session user id' do
        expect(session).to have_key(:user_id)
      end

      it 'sets the session user id to the actual user id' do
        expect(session[:user_id]).to eq @user.id
      end
    end

    describe "when unsuccessful" do
      it 'redirects to login page' do
        post :create, session: { email: nil, password: nil }
        expect(response).to redirect_to login_path
      end

      it 'sets a flash error' do
        post :create, session: { email: nil, password: nil }
        expect(flash[:error]).to have_content 'Incorrect username or password. Please try again'
      end

      it 'does not set the session user id' do
        post :create, session: { email: nil, password: nil }
        expect(session[:user_id]).to be_nil
      end
    end
  end

  describe 'GET #destroy' do
    before(:each){
      session[:user_id] = create(:user).id
    }
    it 'removes the session user id' do
      delete :destroy
      expect(session[:user_id]).to be_nil
    end
  end

end
