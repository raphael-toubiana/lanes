# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "Cleaning database..."
Trip.destroy_all

puts "Creating new trips..."

sea_trip = Trip.create!(
                        title:                   "Promenade à la mer",
                        difficulty:              3,
                        length:                  70,
                        starting_city_name:      "Montpellier",
                        starting_city_zipcode:   "34070",
                        starting_street_address: "3 Pl. Martyrs de la Résistance",
                        ending_city_name:        "Palavas-les-Flots",
                        ending_city_zipcode:     "34250",
                        ending_street_address:   "37 Bd Sarrail"
)

if sea_trip.valid?
    puts "#{sea_trip.title} successfully created"
else
    puts "#{sea_trip.title} failed to be created"
end

mountain_trip = Trip.create!(
    title:                   "Pic Saint Loup",
    difficulty:              7,
    length:                  100,
    starting_city_name:      "Montpellier",
    starting_city_zipcode:   "34070",
    starting_street_address: "3 Pl. Martyrs de la Résistance",
    ending_city_name:        "Cazevieille",
    ending_city_zipcode:     "34270",
    ending_street_address:   "110 rue du Pic Saint Loup"
)

if mountain_trip.valid?
    puts "#{mountain_trip.title} successfully created"
else
    puts "#{mountain_trip.title} failed to be created"
end


