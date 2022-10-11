class ReviewsController < ApplicationController
    before_action :set_trip, only: [:new, :create]
    before_action :set_review, only: [:edit, :update]

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

    def edit
    end

    def update
        @review.update(review_params)
        if @review.save
            redirect_to trip_path(@review.trip)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def set_trip
        @trip = Trip.find(params[:trip_id])
    end

    def set_review
        @review = Review.find(params[:id])
    end
    
    def review_params
        params.require(:review).permit(:rating, 
                                       :content
                                      )
    end
end
