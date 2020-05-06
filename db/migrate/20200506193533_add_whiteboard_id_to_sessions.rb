class AddWhiteboardIdToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :whiteboard_id, :string
  end
end
