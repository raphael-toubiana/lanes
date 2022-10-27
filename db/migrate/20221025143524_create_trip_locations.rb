class CreateTripLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :trip_locations do |t|
      t.references :trip, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true

      t.timestamps
    end
  end
end
