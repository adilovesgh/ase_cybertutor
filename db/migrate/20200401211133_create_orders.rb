class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :session_id
      t.integer :account_id
      t.integer :status
      t.string :token
      t.string :charge_id
      t.string :error_message
      t.string :customer_id
      t.integer :payment_gateway
      t.timestamps
    end
    add_monetize :orders, :price, currency: { present: false }
  end
end