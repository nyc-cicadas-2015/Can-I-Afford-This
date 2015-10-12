class PurchasesController < ApplicationController
  before_action :find_user, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @purchase = Purchase.new
    @purchases = @user.purchases.all
  end

  def show
    @purchase = Purchase.find params[:id]
  end

  def new
    @purchase = Purchase.new
  end

  def create
    purchase_type = Purchase.add_purchase_type(params[:purchase][:cost])
    purchase = @user.purchases.build(cost: params[:cost], title: params[:title], purchase_type_id: purchase_type)
    if !purchase.save
      flash[:error] = "Your purchase must be greater than $0."
    end
      redirect_to user_path(session[:user_id])
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])
    if @purchase.update_attributes purchases_params
      redirect_to user_path(session[:user_id])
    else
      flash[:error] = "Your purchase must have a name and be greater than $0."
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
    params.require(:purchase).permit(:purchase_type_id, :cost, :title)
  end
end
