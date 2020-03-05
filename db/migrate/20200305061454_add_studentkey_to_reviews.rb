class AddStudentkeyToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :student, index: true, foreign_key: true
  end
end
