class CreateContexts < ActiveRecord::Migration
  def change
    create_table :contexts do |t|
      t.string :name
      t.references :mission, index: true

      t.timestamps
    end
  end
end
