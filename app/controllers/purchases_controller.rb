class PurchasesController < ActionController::Base

  def index
    @purchase = Purchase.new
  end

  def show
    @purchase = Purchase.find params[:id]
  end
end
