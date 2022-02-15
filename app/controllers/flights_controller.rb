class FlightsController < ApplicationController
  def new
    @flight = Flight.new
  end

  def create
    Flight.create flight_params

    redirect_to flights_path
  end

  def index
    @flights = Flight.all
  end

  def show
    @flight = Flight.find params[:id]
  end

  def edit
    @flight = Flight.find params[:id]
  end

  def update
    flight = Flight.find params[:id]
    flight.update! flight_params
    redirect_to flight_path(params[:id])
  end

  def destroy
    Flight.destroy params[:id]
    redirect_to flights_path
  end

  private
  def flight_params
    params.require(:flight).permit(
      :date_flight,
      :origin,
      :destination,
      :airplane_id
    )
  end
end
