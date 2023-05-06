class RemoveIndexUidName < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, name: 'uid_name_users_index'
  end
end
