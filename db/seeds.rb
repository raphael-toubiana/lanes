# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "Cleaning database..."
Review.destroy_all
Trip.destroy_all

puts "Creating new trips..."

sea_trip = Trip.create!(
                        title:                   "Promenade à la mer",
                        short_description:       "Une superbe promenade le long du Lez",
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
    short_description:       "Itinéraire sportif à travers les Oliviers",
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

puts "Creation new reviews..."

review_1 = Review.new(
  rating: 8,
  content: "Franchement pas mal, un peu sportif sur la fin"
)

review_1.trip = mountain_trip
if review_1.save
  puts "Review 1 successfully created"
else
  puts "Review 1 failed to be created"
end

review_2 = Review.new(
  rating: 9,
  content: "J'ai adoré et j'en redemande !"
)

review_2.trip = mountain_trip
if review_2.save
  puts "Review 2 successfully created"
else
  puts "Review 2 failed to be created"
end

review_3 = Review.new(
  rating: 6,
  content: "Pas mal, mais trop court !"
)

review_3.trip = sea_trip
if review_3.save
  puts "Review 3 successfully created"
else
  puts "Review 3 failed to be created"
end
