class FlightsController < ApplicationController

  before_action :fetch_user

  before_action :check_if_logged_in, only: [:new, :edit, :destroy, :create]

  def new
    @flight = Flight.new
  end

  def create
    Flight.create flight_params
    redirect_to flights_path
  end

  def index
    @flights = Flight.all.order('date_flight ASC')
  end


  def edit
    @flight = Flight.find params[:id]
  end

  def update
    flight = Flight.find params[:id]
    flight.update! flight_params
    redirect_to flights_path
  end

  def destroy
    Flight.destroy params[:id]
    redirect_to flights_path
  end

  def search
    flights = Flight.where("origin ILIKE ? and destination ILIKE ?", "%#{params[:origin]}%", "%#{params[:destination]}%")
    if flights.any?
        render json: flights
    else    
        render json: {error: "No flights found"}, status: 404
    end
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
