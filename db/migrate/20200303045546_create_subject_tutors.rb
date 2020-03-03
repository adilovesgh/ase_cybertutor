class CreateSubjectTutors < ActiveRecord::Migration
  def change
    create_table :subject_tutors do |t|
      t.references :tutor, index: true, foreign_key: true
      t.references :subject

      t.timestamps null: false
    end
  end
end
