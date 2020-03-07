class AddNameToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :name, :string
    add_column :tutors, :experience, :integer
    add_column :tutors, :rate, :float
  end
end
