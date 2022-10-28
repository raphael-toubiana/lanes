class TripsController < ApplicationController
    before_action :set_trip, only: [:show, :edit, :update, :destroy]

    def index
        @trips = Trip.all
    end

    def show
      @markers = @trip.all_locations.map do |location|
        {
          lat: location.latitude,
          lng: location.longitude
        }
      end
    end

    def new
        @trip = Trip.new
    end

    def create
        @trip = Trip.new(trip_params)
        if @trip.save
          redirect_to trip_path(@trip)
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @trip.update(trip_params)
          redirect_to trip_path(@trip)
        else
          render :edit, status: :unprocessable_entity
        end
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
                                     :short_description,
                                     :cover_picture
                                    )

    end

    def set_trip
        @trip = Trip.find(params[:id])
    end
end
