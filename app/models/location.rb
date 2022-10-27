class Location < ApplicationRecord
      has_many :trip_locations, dependent: :destroy
      has_many :trips, through: :trip_locations
end
