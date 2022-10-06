class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string  :title
      t.integer :difficulty
      t.integer :length
      t.string  :starting_city_name
      t.string  :starting_city_zipcode
      t.string  :starting_street_address
      t.string  :ending_city_name
      t.string  :ending_city_zipcode
      t.string  :ending_street_address

      t.timestamps
    end
  end
end
