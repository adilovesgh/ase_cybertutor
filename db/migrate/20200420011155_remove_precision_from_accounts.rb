class RemovePrecisionFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :precision, :string
  end
end
