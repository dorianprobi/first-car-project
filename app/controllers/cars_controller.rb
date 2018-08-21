class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.create!(car_params)
    if @car.save
      redirect_to car_path(@car)
    else
      render 'new'
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

private

  def car_params
    params.require(:car).permit(:brand, :price)
  end
end
