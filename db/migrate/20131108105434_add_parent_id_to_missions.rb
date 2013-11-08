class AddParentIdToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :parent_id, :integer
  end
end
