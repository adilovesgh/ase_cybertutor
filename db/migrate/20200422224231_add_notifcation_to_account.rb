class AddNotifcationToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :notification, :integer
  end
end
