class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :trips, :starting_address, :starting_street_address
    rename_column :trips, :ending_address, :ending_street_address
  end
end
