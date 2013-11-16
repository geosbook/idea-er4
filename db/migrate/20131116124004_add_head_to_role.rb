class AddHeadToRole < ActiveRecord::Migration
  def change
    add_column :roles, :head, :boolean, default: false
  end
end
