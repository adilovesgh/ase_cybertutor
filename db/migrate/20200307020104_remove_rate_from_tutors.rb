class RemoveRateFromTutors < ActiveRecord::Migration
  def change
    remove_column :tutors, :rate, :float
  end
end
