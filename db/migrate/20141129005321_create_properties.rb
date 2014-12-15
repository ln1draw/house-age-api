class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :parcel_number
      t.string :year_built
      t.string :address
      t.string :property_type
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
