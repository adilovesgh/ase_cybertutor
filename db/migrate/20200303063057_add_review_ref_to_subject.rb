class AddReviewRefToSubject < ActiveRecord::Migration
  def change
    add_reference :subjects, :review, index: true, foreign_key: true
  end
end
