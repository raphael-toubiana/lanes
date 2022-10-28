class Trip < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :trip_locations, dependent: :destroy
  has_many :locations, through: :trip_locations
  has_one_attached :cover_picture

  validates :title, presence: true

  validates :short_description, presence: true, length: {minimum: 20 }
  validates :difficulty, :length, presence: true, numericality: { only_integer: true }

  def origin_address
    self.trip_locations.find_by(starting_location: true)
  end

  def target_address
    self.trip_locations.find_by(target_location: true)
  end

  def display_origin_address
    if self.trip_locations.any? do |trip_location| trip_location.starting_location == true end
       origin_address.location.address
    else
      "Veuillez ajouter une adresse de départ"
    end
  end

  def display_target_address
    if self.trip_locations.any? do |trip_location| trip_location.target_location == true end
      target_address.location.address
    else
      "Veuillez ajouter une adresse d'arrivée"
    end
  end

  def all_trip_locations
    TripLocation.where(trip_id: self.id)
  end

  def all_locations
    locations = []
    all_trip_locations.each do |trip_location|
      locations << trip_location.location
    end
  locations
  end

  def is_missing_origin_or_target_address
    self.origin_address.nil? || self.target_address.nil?
  end
end
