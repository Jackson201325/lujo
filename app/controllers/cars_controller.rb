class CarsController < ApplicationController
  def index
    @cars = Car.all
    policy_scope(@cars)

  end

  def mycars
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
    @car = Car.find(params[:id])
    authorize(@car)
  end

  def update
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to user_cars_path(current_user)
  end

  private

  def car_params
    params.require('car').permit(:address, :user_id, :year, :brand, :model, :odometer, :transmission, :license_plate, :description, :price_per_day)
  end
end
