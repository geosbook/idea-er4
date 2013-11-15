class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :type
      t.float :lat
      t.float :lng
      t.string :status

      t.timestamps
    end
  end
end
