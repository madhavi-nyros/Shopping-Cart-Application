class AddCategory < ActiveRecord::Migration
  def up
add_column:categories, :product_id, :integer
  end

  def down
remove_column:categories, :product_id
  end
end
