class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.integer :year
      t.string :brand
      t.string :model
      t.integer :odometer
      t.string :transmission
      t.string :license_plate
      t.string :description
      t.string :image
      t.boolean :availability
      t.float :latitude
      t.float :longitude
      t.integer :price_per_day

      t.timestamps
    end
  end
end
