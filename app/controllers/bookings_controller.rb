class BookingsController < ApplicationController
    def index
        @bookings = Booking.all
        policy_scope(@bookings)
    end
    
    def my_bookings
        @bookings = current_user.bookings
        @my_cars = current_user.cars
        # @incoming_bookings = current_user.cars.bookings
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

    def accept 
        @booking = Booking.find(params[:id])
        authorize(@booking)
        @booking.update(status: "Accepted!")
        redirect_to user_bookings_path
    end

    def reject 
        @booking = Booking.find(params[:id])
        authorize(@booking)
        @booking.update(status: "Rejected")
        redirect_to user_bookings_path
    end

    private

    def booking_params
        params.require('booking').permit(:status, :start_date, :end_date, :price)
    end
end
