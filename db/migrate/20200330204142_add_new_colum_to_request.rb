class AddNewColumToRequest < ActiveRecord::Migration
  def change
    add_reference :requests, :tutor, index: true, foreign_key: true
    add_reference :requests, :student, index: true, foreign_key: true
    add_reference :requests, :session, index: true, foreign_key: true
  end
end
