class RemoveReviewRefToTutor < ActiveRecord::Migration
  def change
    remove_reference :tutors, :review, index: true, foreign_key: true
  end
end
