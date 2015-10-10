class PurchasesController < ApplicationController

  def index
    @purchase = Purchase.new
  end

  def show
    @purchase = Purchase.find params[:id]
  end

  def create
    find_user
    purchase = @user.purchases.new(purchases_params)
    if purchase.save
      redirect_to user_path(session[:user_id])
    else
      flash[:error] = "Your purchase must be greater than $0."
      redirect_to user_path(session[:user_id])
    end
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])
    if @purchase.update_attributes purchases_params
      redirect_to user_path(session[:user_id])
    else
      flash[:error] = "Your purchase must be greater than $0."
      redirect_to user_path(session[:user_id])
    end
  end

   def destroy
    purchase = Purchase.find(params[:id])
    purchase.destroy
    redirect_to user_path(session[:user_id])
  end


  private

  def find_user
    @user = User.find(session[:user_id])
  end

  def purchases_params
    params.require(:purchase).permit(:purchase_type_id, :cost)
  end
end
