class TripLocationsController < ApplicationController
  before_action :set_trip, only: [:index, :new, :create]
  before_action :set_trip_location, only: [:edit, :update]

  def new
    if params[:starting_location]
      @trip_location = TripLocation.new(starting_location: params[:starting_location])
    elsif params[:target_location]
      @trip_location = TripLocation.new(target_location: params[:target_location])
    else
      @trip_location = TripLocation.new
    end
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

  def edit
  end

  def update
    @location = @trip_location.location
    @location.update(address: params[:location][:address])
    @location.save!
    if @trip_location.save
        redirect_to trip_path(@trip_location.trip)
    else
        render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_trip_location
    @trip_location = TripLocation.find(params[:id])
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
