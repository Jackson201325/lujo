class CarsController < ApplicationController
  def index

  end

  def mycars
    @cars = current_user.cars
  end
  
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    @car.save
    redirect_to
  end

  def edit
  end

  def show
    @car = Car.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def car_params
    params.require('car').permit(:address, :user_id, :year, :brand, :model, :odometer, :transmission, :license_plate, :description, :price_per_day)
  end
end
