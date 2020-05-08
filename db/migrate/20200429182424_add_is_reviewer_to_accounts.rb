class AddIsReviewerToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :is_reviewer, :boolean
  end
end
