class BookingsController < ApplicationController
    def index
        @bookings = Booking.all
        policy_scope(@bookings)
    end
    
    def my_bookings
        @bookings = current_user.bookings
        authorize(@bookings)
    end
    
    def new
        @booking = Booking.new
        authorize(@booking)
    end
    
    def create
        @car = Car.find(params[:car_id])
        @booking = Booking.new(booking_params)
        @booking.user = current_user
        @booking.car = @car
        @booking.status = 'Pending'
        @booking.price = (@booking.end_date - @booking.start_date) * @car.price_per_day
        @booking.save
        authorize(@booking)
        redirect_to user_bookings_path(current_user)
    end
    
    def edit
        @booking = Booking.find(params[:id])
        authorize(@booking)
    end
    
    def show
        @booking = Booking.find(params[:id])
        authorize(@booking)
        # raise
    end
    
    def update
        @booking = Booking.find(params[:id])
        @booking.update(booking_params)
        authorize(@booking)
        redirect_to user_bookings_path
    end

    private

    def booking_params
        params.require('booking').permit(:status, :start_date, :end_date, :price)
    end
end
