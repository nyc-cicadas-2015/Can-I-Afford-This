class GraphController < ApplicationController

  def index
  end

  def data
    purchase_obj = User.find(session[:user_id]).purchases
    @user_purchases = purchase_obj.map { |p| p.cost }
    respond_to do |format|
      format.json{
        render :json => @user_purchases
      }
    end
  end


end