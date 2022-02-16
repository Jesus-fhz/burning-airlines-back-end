class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    Reservation.create reservation_params
  end

  def index
  end

  def show
    @reservation = Reservation.find params[:id]
  end

  def edit
    @reservation = Reservation.find params[:id]

  end

  def update
  end

  def destroy
    @reservation.destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:row, :column, :user_id, :flight_id)
  end


end
