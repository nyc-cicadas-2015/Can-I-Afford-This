class AddTitleToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :title, :string
  end
end
