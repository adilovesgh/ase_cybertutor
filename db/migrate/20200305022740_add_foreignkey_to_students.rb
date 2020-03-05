class AddForeignkeyToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :account, index: true, foreign_key: true
  end
end
