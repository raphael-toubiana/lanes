module TripsHelper
  def display_origin_address
    if self.trip_locations.any? do |trip_location| trip_location.starting_location == true end
      return origin_address
    else
      "Veuillez ajouter une adresse de départ"
    end
  end

  def display_target_address
    if self.trip_locations.any? do |trip_location| trip_location.target_location == true end
      return target_address
    else
      "Veuillez ajouter une adresse d'arrivée"
    end
  end
end
