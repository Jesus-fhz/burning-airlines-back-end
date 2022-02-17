class ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token,  raise: false

  def new
    @reservation = Reservation.new
  end

  def create
    result = Reservation.create(
      user_id: params[:user_id],
      flight_id: params[:flight_id],
      row: params[:row],
      column: params[:column]
    )
    if result.persisted?
      render json: result
    else
      render json: {error: "There was an error booking"}
    end
    
    
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
    #params.require(:reservation).permit(:row, :column, :user_id, :flight_id)
  end


end
