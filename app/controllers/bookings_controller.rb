class BookingsController < ApplicationController

  def show
    @car = Car.find(params[:car_id])
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @booking.car = @car
    @booking.user = current_user
     if @booking.save
      flash[:notice] = "Your booking has been placed"
      redirect_to car_booking_path(@car, @booking)
    else
      flash[:alert] = @booking.errors.full_messages
      render 'cars/show'
    end
  end


  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
    redirect_to car_path(@booking.car)
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :car_id)
  end
end
