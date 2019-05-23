class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index, :show]
  def index
    if params[:query].present?
      # if params[:query].to_i == Car.where(year: params[:query].to_i)
      #   params[:query].to_i
      # end
      @cars = Car.search_by_car_attributes(params[:query])
    else
      @cars = Car.all
    end
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
    @car = Car.find(params[:id])
    authorize(@car)
  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
    authorize(@car)
    # raise
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

# OR year ILIKE :query