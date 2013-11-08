class CreateMissionHierarchies < ActiveRecord::Migration
  def change
    create_table :mission_hierarchies, :id => false do |t|
      t.integer  :ancestor_id, :null => false   # ID of the parent/grandparent/great-grandparent/... mission
      t.integer  :descendant_id, :null => false # ID of the target mission
      t.integer  :generations, :null => false   # Number of generations between the ancestor and the descendant. Parent/child = 1, for example.
    end

    # For "all progeny of…" and leaf selects:
    add_index :mission_hierarchies, [:ancestor_id, :descendant_id, :generations],
      :unique => true, :name => "mission_anc_desc_udx"

    # For "all ancestors of…" selects,
    add_index :mission_hierarchies, [:descendant_id],
      :name => "mission_desc_idx"

  end
end
