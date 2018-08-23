class CarsController < ApplicationController

  def index
    @cars = search_for_car(Car.all)
    # params[:query]
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

  def search_for_car(scope)
    if params[:query].present?
      Car.full_text_search(params[:query])
    else
      Car.all
    end
  end

  def further_surch
     if params[:query].present?
      sql_query = "brand ILIKE :query OR description ILIKE :query OR price ILIKE :query"
      @cars = Car.where(sql_query, query: "%#{params[:query]}%")
    else
      @cars = Car.all
    end
  end
end
