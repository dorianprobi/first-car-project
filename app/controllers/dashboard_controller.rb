class DashboardController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end
end
