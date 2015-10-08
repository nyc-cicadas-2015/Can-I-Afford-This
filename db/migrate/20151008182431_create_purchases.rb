class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :user, index: true, foreign_key: true
      t.string :category
      t.integer :cost
    end
  end
end
