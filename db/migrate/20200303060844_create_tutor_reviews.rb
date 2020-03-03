class CreateTutorReviews < ActiveRecord::Migration
  def change
    create_table :tutor_reviews do |t|
      t.references :review, index: true, foreign_key: true
      t.references :tutor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
