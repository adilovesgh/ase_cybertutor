class AddAverageRatingToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :average_rating, :float
  end
end
