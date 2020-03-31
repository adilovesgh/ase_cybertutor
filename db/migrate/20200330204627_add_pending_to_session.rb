class AddPendingToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :pending, :boolean
  end
end
