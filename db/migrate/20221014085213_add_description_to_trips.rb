class AddDescriptionToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :short_description, :text
  end
end
