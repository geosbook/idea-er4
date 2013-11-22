class RemoveHeadFromRole < ActiveRecord::Migration
  def change
    remove_column :roles, :head
    add_column :roles, :headofunit, :boolean
    
  end
end
