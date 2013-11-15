class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
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
