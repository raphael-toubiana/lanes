class TripsController < ApplicationController

    def index
        @trips = Trip.all
    end

    def show
        @trip = Trip.find(params[:id])
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
        @trip = Trip.find(params[:id])
    end

    def update
        @trip = Trip.find(params[:id])
        @trip.update(trip_params)
        
        redirect_to trip_path(@trip)
    end
    
    def destroy
        @trip = Trip.find(params[:id])
        @trip.destroy
        
        redirect_to root_path, status: :see_other
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



end
