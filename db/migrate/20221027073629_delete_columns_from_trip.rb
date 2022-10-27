class DeleteColumnsFromTrip < ActiveRecord::Migration[7.0]
  def change
    remove_column :trips, :starting_city_name
    remove_column :trips, :starting_city_zipcode
    remove_column :trips, :starting_street_address
    remove_column :trips, :ending_city_name
    remove_column :trips, :ending_city_zipcode
    remove_column :trips, :ending_street_address
  end
end
