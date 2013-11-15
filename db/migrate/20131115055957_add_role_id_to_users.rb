class AddRoleIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :role_id, index: true
  end
end
