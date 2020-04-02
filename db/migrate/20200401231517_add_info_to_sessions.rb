class AddInfoToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :stripe_plan_name, :string
	add_column :sessions, :paypal_plan_name, :string
	add_monetize :sessions, :price, currency: { present: true }
  end
end
