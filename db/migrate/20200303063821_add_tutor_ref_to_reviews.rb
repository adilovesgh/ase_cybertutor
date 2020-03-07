class AddTutorRefToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :tutor, index: true, foreign_key: true
  end
end
