class CreateSavings < ActiveRecord::Migration
  def change
    create_table :savings do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :amount
    end
  end
end
