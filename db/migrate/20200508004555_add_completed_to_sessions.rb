class AddCompletedToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :completed, :boolean
  end
end
