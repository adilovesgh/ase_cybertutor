class AddForeignkeyToTutors < ActiveRecord::Migration
  def change
    add_reference :tutors, :account, index: true, foreign_key: true
  end
end
