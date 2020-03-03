class CreateStudentsSubjects < ActiveRecord::Migration
  def change
    create_table :students_subjects do |t|
      t.references :subject, index: true, foreign_key: true
      t.references :student

      t.timestamps null: false
    end
  end
end
