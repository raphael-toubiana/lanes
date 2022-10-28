class Location < ApplicationRecord
  has_many :trip_locations, dependent: :destroy
  has_many :trips, through: :trip_locations

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
