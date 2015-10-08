class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :user, index: true, foreign_key: true, null:false
      t.string :type, null:false
      t.integer :amount, null:false

      t.timestamps null:false
    end
  end
end
