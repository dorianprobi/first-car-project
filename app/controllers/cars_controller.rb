class CarsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(user_params)

    redirect_to car_path(@car)
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to car_path(@car)
  end

  private

  def user_params
    params.require(:car).permit(:brand, :price)
  end
end
