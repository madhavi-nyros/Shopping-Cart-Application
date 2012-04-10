class AddExpiredateProducts < ActiveRecord::Migration
  def up
add_column :products, :expires_on, :date
  end

  def down
remove_column :products, :expires_on
  end
end
