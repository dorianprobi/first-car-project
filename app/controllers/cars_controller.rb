class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user_as_owner = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      flash[:alert] = @car.errors.full_messages
      render 'new'
    end
  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)

    redirect_to car_path(@car)
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:brand, :price, :description, :photo, :user_id)
  end
end
