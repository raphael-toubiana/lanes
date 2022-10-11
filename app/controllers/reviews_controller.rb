class ReviewsController < ApplicationController
    before_action :set_trip, only: [:new, :create]

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.trip = @trip
        if @review.save
            redirect_to trip_path(@trip)
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def set_trip
        @trip = Trip.find(params[:trip_id])
    end
    
    def review_params
        params.require(:review).permit(:rating, 
                                       :content
                                      )

    end
end
