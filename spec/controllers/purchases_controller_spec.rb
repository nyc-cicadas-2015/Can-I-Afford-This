class PurchasesController < ActionController::Base

  def index
    @purchase = Purchase.new
  end
end