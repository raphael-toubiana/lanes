class AddCoordinatesToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :starting_latitude, :float
    add_column :trips, :starting_longitude, :float
    add_column :trips, :ending_latitude, :float
    add_column :trips, :ending_longitude, :float
  end
end
