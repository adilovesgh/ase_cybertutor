class CreateStudentsTutors < ActiveRecord::Migration
  def change
    create_table :students_tutors do |t|
      t.references :tutor, index: true, foreign_key: true
      t.references :students, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
