class AddPurchasedToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :purchased?, :boolean, default: false
  end
end
