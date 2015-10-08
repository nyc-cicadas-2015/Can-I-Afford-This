class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :user, index: true, foreign_key: true, null:false
      t.string :category, null:false
      t.integer :cost, null:false

      t.timestamps null:false
    end
  end
end
