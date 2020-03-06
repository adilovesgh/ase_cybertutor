class RemoveNameFromTutors < ActiveRecord::Migration
  def change
    remove_column :tutors, :name, :string
  end
end
