class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :student, index: true, foreign_key: true
      t.references :tutor, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true
      t.float :rate
      t.datetime :time

      t.timestamps null: false
    end
  end
end
