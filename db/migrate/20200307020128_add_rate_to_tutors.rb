class AddRateToTutors < ActiveRecord::Migration
  def change
    add_monetize :tutors, :price, currency: { present: false }
    add_column :tutors, :precision, :string
  end
end
