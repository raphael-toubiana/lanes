class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :trips, :starting_street_address, :starting_street_address
    rename_column :trips, :ending_street_address, :ending_street_address
  end
end
