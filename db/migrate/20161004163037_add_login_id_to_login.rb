class AddLoginIdToLogin < ActiveRecord::Migration
  def change
    add_column :logins, :login_id, :string
    add_column :logins, :user_id, :string
  end
end
