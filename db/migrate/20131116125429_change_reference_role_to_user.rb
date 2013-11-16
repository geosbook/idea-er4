class ChangeReferenceRoleToUser < ActiveRecord::Migration
  def change
    remove_column :users, :role_id_id
    add_reference :users, :role, index: true
  end
end
