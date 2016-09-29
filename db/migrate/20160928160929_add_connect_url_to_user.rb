class AddConnectUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :connect_url, :string
  end
end
