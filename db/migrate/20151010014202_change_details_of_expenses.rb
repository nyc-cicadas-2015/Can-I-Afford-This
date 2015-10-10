class ChangeDetailsOfExpenses < ActiveRecord::Migration
  def change
    change_table :expenses do |t|
      t.remove :expense_type
      t.references :expense_type, null:false
    end
  end
end
