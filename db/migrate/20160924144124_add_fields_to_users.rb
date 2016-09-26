class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :spectre_id, :string
    add_column :users, :identifier, :string
    add_column :users, :secret,     :string
  end
end
