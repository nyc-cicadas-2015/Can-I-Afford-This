class AddSavingsAmountDefaultValue < ActiveRecord::Migration
  def change
    change_column :savings, :amount, :integer, default: 0
  end
end