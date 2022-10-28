class AddColumnsToTripLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :trip_locations, :starting_location, :boolean
    add_column :trip_locations, :target_location, :boolean
  end
end
