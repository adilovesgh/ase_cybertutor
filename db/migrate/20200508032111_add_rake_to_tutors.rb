class AddRakeToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :rake, :float
  end
end
