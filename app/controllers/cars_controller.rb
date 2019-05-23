class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index, :show]
  def index
    @cars = Car.all
    @cars_markers = Car.where.not(latitude: nil, longitude: nil)
    policy_scope(Car)
    @markers = @cars_markers.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude
      }
    end
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

  def edit
    @car = Car.find(params[:id])
    authorize(@car)
  end

  def show
    @car = Car.find(params[:id])  
    @markers =[{:lat=>@car.latitude, :lng=>@car.longitude}]
    authorize(@car)
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    authorize(@car)
    redirect_to user_cars_path
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    authorize(@car)
    redirect_to user_cars_path(current_user)
  end

  private

  def car_params
    params.require('car').permit(:address, :user_id, :year, :brand, :model, :odometer, :transmission, :license_plate, :image, :description, :price_per_day)
  end
end
