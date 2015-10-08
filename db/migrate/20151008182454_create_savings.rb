class CreateSavings < ActiveRecord::Migration
  def change
    create_table :savings do |t|
      t.references :user, index: true, foreign_key: true, null:false
      t.integer :amount, null:false

      t.timestamps null:false
    end
  end
end
