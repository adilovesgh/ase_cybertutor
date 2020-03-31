class AddVerifiedToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :verified, :boolean
  end
end
