class ChangeDetailsOfPurchases < ActiveRecord::Migration
  def change
    change_table :purchases do |t|
      t.remove :category
      t.references :purchase_types, null:false
    end
  end
end
