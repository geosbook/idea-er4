class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :parent_id
      t.integer :enrollable_id
      t.string :enrollable_type
      t.integer :mission_id
      t.integer :manager_id

      t.timestamps
    end
  end
end
