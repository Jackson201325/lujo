class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    policy_scope(Car)
 
    if params[:query].present?
      # if params[:query].to_i == Car.where(year: params[:query].to_i)
      #   params[:query].to_i
      # end
      @cars = Car.search_by_car_attributes(params[:query])
      @cars_markers = @cars.where.not(latitude: nil, longitude: nil)
      @markers = @cars_markers.map do |car|
        {
          lat: car.latitude,
          lng: car.longitude
        }
      end
    else
      @cars_markers = Car.where.not(latitude: nil, longitude: nil)
      @markers = @cars_markers.map do |car|
        {
          lat: car.latitude,
          lng: car.longitude
        }
      end
      @cars = Car.all
    end
    policy_scope(@cars)
  end

  def my_cars
    @cars = current_user.cars
    @cars_markers = Car.where.not(latitude: nil, longitude: nil)
    policy_scope(Car)
    @markers = @cars_markers.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude
      }
    end
    authorize(@cars)
  end

  def new
    @car = Car.new
    authorize(@car)
  end

  def create
    @car = Car.new(car_params)
    authorize(@car)
    @car.user = current_user
    @car.save
    redirect_to user_cars_path(current_user)
  end

  def show
    @markers = [{ lat: @car.latitude, lng: @car.longitude }]
    @booking = Booking.new
    authorize(@car)
  end

  def edit
    authorize(@car)
  end

  def update
    @car.update(car_params)
    authorize(@car)
    redirect_to user_cars_path
  end

  def destroy
    @car.destroy
    authorize(@car)
    redirect_to user_cars_path(current_user)
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require('car').permit(:address, :user_id, :year, :brand, :model, :odometer, :transmission, :license_plate, :image, :description, :price_per_day)
  end
end
