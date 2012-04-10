class AddExpressTokenToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :express_token, :string

    add_column :orders, :express_payer_id, :string

    add_column :orders, :amount, :float

  end
end
