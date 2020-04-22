class AddSeenstudentToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :seen_student, :boolean
  end
end
