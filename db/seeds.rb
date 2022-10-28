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
Location.destroy_all
TripLocation.destroy_all

puts "Creating new trips..."

sea_trip = Trip.new(

                        title:                   "Promenade à la mer",
                        short_description:       "Une superbe promenade le long du Lez",
                        difficulty:              3,
                        length:                  70
)

if sea_trip.save
    puts "Sea trip successfully created ✅"
else
    puts "Sea trip failed to be created ❌"
end


mountain_trip = Trip.create!(
    title:                   "Pic Saint Loup",
    short_description:       "Itinéraire sportif à travers les Oliviers",
    difficulty:              7,
    length:                  100
)

if mountain_trip.save
    puts "Moutain trip successfully created ✅"
else
    puts "Moutain trip failed to be created ❌"
end

puts "Creating new reviews..."

review_1 = Review.new(
  rating: 7,
  content: "Franchement pas mal, un peu sportif sur la fin"
)

review_1.trip = mountain_trip
if review_1.save
  puts "Review 1 successfully created ✅"
else
  puts "Review 1 failed to be created ❌"
end

review_2 = Review.new(
  rating: 9,
  content: "J'ai adoré et j'en redemande !"
)

review_2.trip = mountain_trip
if review_2.save
  puts "Review 2 successfully created ✅"
else
  puts "Review 2 failed to be created ❌"
end

review_3 = Review.new(
  rating: 6,
  content: "Pas mal, mais trop court !"
)

review_3.trip = sea_trip
if review_3.save
  puts "Review 3 successfully created ✅"
else
  puts "Review 3 failed to be created ❌"
end

puts "Creating new locations..."

location_1 = Location.new(address: "3 Pl. Martyrs de la Résistance, 34070, Montpellier")
if location_1.save
  puts "Location 1 successfully created ✅"
else
  puts "Location 1 failed to be created ❌"
end
location_2 = Location.new(address: "37 Bd Sarrail, 34250, Palavas-les-flots")
if location_2.save
  puts "Location 2 successfully created ✅"
else
  puts "Location 2 failed to be created ❌"
end
location_3 = Location.new(address: "110 rue du Pic Saint Loup, 34270, Cazevieille")
if location_3.save
  puts "Location 3 successfully created ✅"
else
  puts "Location 3 failed to be created ❌"
end

puts "Creating new trip_locations"

sea_trip_origin_location = TripLocation.new(trip_id: sea_trip.id, location_id: location_1.id, starting_location: true)
if sea_trip_origin_location.save
  puts "Sea trip origin location successfully created ✅"
else
  puts "Sea trip origin location failed to be created ❌"
end

sea_trip_target_location = TripLocation.new(trip_id: sea_trip.id, location_id: location_2.id, target_location: true)
if sea_trip_target_location.save
  puts "Sea trip target location successfully created ✅"
else
  puts "Sea trip target location failed to be created ❌"
end

mountain_trip_origin_location = TripLocation.new(trip_id: mountain_trip.id, location_id: location_1.id, starting_location: true)
if mountain_trip_origin_location.save
  puts "Moutain trip origin location successfully created ✅"
else
  puts "Moutain trip origin location failed to be created ❌"
end

mountain_trip_target_location = TripLocation.new(trip_id: mountain_trip.id, location_id: location_3.id, target_location: true)
if mountain_trip_target_location.save
  puts "Moutain trip target location successfully created ✅"
else
  puts "Moutain trip target location failed to be created ❌"
end
