class WelcomeController < ApplicationController
  def index
    # current_user
    @user = User.new
  end
end
