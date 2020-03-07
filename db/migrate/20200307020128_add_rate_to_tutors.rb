class AddRateToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :rate, :float
    add_column :tutors, :precision, :string
  end
end
