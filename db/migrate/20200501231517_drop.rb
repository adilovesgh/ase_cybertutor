class Drop < ActiveRecord::Migration
  def change
    remove_column :tutors, :rate
    remove_column :sessions, :rate
    add_monetize :tutors, :price, currency: { present: false }
  end
end
