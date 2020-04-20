class AddBalanceToAccounts < ActiveRecord::Migration
  def change
  	add_monetize :accounts, :price, currency: { present: false }
    add_column :accounts, :precision, :string
  end
end
