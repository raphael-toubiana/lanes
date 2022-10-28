class TripLocationsController < ApplicationController
  before_action :set_trip, only: [:index, :new, :create]

  def index
    @trip_locations = @trip.trip_locations
  end

  def new
    @trip_location = TripLocation.new
    @location = Location.new
  end

  def create
    @trip_location = TripLocation.new(trip_location_params)
    @location = Location.create!(location_params)
    @trip_location.location_id = @location.id
    @trip_location.trip_id = @trip.id
    if @trip_location.save!
        redirect_to trip_path(@trip)
    else
        render :new, status: :unprocessable_entity
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def trip_location_params
    params.require(:trip_location).permit(:starting_location,
                                          :target_location
                                          )
  end

  def location_params
    params.require(:location).permit(:address)
  end

end
