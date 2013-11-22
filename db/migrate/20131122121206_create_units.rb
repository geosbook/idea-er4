class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.string :type
      t.float :lat
      t.float :lng
      t.float :speed
      t.float :course
      t.float :height
      t.string :status

      t.timestamps
    end
  end
end
