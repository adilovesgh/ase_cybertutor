class CreateReviewsTutors < ActiveRecord::Migration
  def change
    create_table :reviews_tutors do |t|
      t.references :tutor, index: true, foreign_key: true
      t.references :review, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
