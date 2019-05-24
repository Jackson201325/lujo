class BookingsController < ApplicationController
  before_action :set_booking, only: [:accept, :reject]
  # def index
  #   @bookings = Booking.all
  #   policy_scope(@bookings)
  # end

  def my_bookings
    @bookings = current_user.bookings
    @my_cars = current_user.cars
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

  # def edit
  #   authorize(@booking)
  # end

  # def show
  #   authorize(@booking)
  # end

  # def update
  #   @booking.update(booking_params)
  #   authorize(@booking)
  #   redirect_to user_bookings_path
  # end

  def accept
    authorize(@booking)
    @booking.update(status: "Accepted")
    redirect_to user_bookings_path
  end

  def reject
    authorize(@booking)
    @booking.update(status: "Rejected")
    redirect_to user_bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require('booking').permit(:start_date, :end_date, :price, :status)
  end
end
