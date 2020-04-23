class AddSeenToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :seen, :boolean
  end
end
