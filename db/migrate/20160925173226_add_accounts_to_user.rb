class AddAccountsToUser < ActiveRecord::Migration
  def change
    add_column :users, :accounts, :string
  end
end
