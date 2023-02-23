class AddIndexToUser < ActiveRecord::Migration[7.0]
  def change
    add_index :users, [:uid, :name], name: 'uid_name_users_index', unique: true
  end
end
