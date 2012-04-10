class AddMonthOrders < ActiveRecord::Migration
  def up
add_column:orders, :month, :integer
add_column:orders, :year, :integer
add_column:orders, :verification_value, :string
  end

  def down
remove_column :orders, :month ,:year ,:verification_value
  end
end
