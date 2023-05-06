class AddIndexToUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, [:uid, :email], name: 'uid_email_users_index', unique: true
  end
end
