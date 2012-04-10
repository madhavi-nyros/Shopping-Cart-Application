class AddOrders < ActiveRecord::Migration
  def up
add_column:orders, :card_number, :integer
  end

  def down
remove_column :orders, :card_number
  end
end
