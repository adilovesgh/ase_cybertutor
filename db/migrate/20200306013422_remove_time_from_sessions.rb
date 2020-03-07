class RemoveTimeFromSessions < ActiveRecord::Migration
  def change
    remove_column :sessions, :time, :datetime
  end
end
