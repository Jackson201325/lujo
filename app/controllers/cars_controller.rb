class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index, :show]
  def index
    @cars = Car.all
    policy_scope(@cars)

  end

  def my_cars
    @cars = current_user.cars

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

  def edit
  end

  def show
    @car_markers = Car.where.not(latitude: nil, longitude: nil)

    @markers = @car_markers.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude
      }
    end    
    @car = Car.find(params[:id])
    authorize(@car)
    # raise
  end

  def update
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    authorize(@car)
    redirect_to user_cars_path(current_user)
  end

  private

  def car_params
    params.require('car').permit(:address, :user_id, :year, :brand, :model, :odometer, :transmission, :license_plate, :description, :price_per_day)
  end
end
