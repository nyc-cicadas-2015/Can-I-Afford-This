class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :user, index: true, foreign_key: true
      t.string :type
      t.integer :amount
    end
  end
end
