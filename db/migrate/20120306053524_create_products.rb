class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :productname
      t.string :description
      t.string :price
      t.string :catagory

      t.timestamps
    end
  end
end
