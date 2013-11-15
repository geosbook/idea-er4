class CreateRoleHierarchies < ActiveRecord::Migration
  def change
    create_table :role_hierarchies, :id => false do |t|
      t.integer  :ancestor_id, :null => false   # ID of the parent/grandparent/great-grandparent/... mission
      t.integer  :descendant_id, :null => false # ID of the target mission
      t.integer  :generations, :null => false   # Number of generations between the ancestor and the descendant. Parent/child = 1, for example.
    end

    # For "all progeny of…" and leaf selects:
    add_index :role_hierarchies, [:ancestor_id, :descendant_id, :generations],
      :unique => true, :name => "role_anc_desc_udx"

    # For "all ancestors of…" selects,
    add_index :role_hierarchies, [:descendant_id],
      :name => "role_desc_idx"

  end
end
