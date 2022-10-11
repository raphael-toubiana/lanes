class TripsController < ApplicationController
    before_action :set_trip, only: [:show, :edit, :update, :destroy]

    def index
        @trips = Trip.all
    end

    def show
    end

    def new
        @trip = Trip.new
    end

    def create
        @trip = Trip.new(trip_params)
        @trip.save

        redirect_to trip_path(@trip)
    end

    def edit
    end

    def update
        @trip.update(trip_params)
        
        redirect_to trip_path(@trip)
    end
    
    def destroy
        @trip.destroy
        
        redirect_to root_path, status: :see_other
    end

    def hard
        @trips = Trip.where("difficulty > 5")
    end

    def easy
        @trips = Trip.where("difficulty < 5")
    end

    private

    def trip_params
        params.require(:trip).permit(:title, 
                                     :difficulty,
                                     :length, 
                                     :starting_city_name,
                                     :starting_street_address,
                                     :ending_city_name,
                                     :ending_city_zipcode,
                                     :ending_street_address
                                    )

    end

    def set_trip
        @trip = Trip.find(params[:id])
    end
end
