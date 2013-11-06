class CreateGeosmaps < ActiveRecord::Migration
  def change
    create_table :geosmaps do |t|
      t.float :centerlat
      t.float :centerlng
      t.string :name
      t.integer :zoom
      t.string :maptype
      t.references :context, index: true

      t.timestamps
    end
  end
end
