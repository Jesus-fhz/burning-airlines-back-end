class FlightsController < ApplicationController

  skip_before_action :verify_authenticity_token,  raise: false

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

  def show
    headers['Access-Control-Allow-Origin'] = '*'
    flight = Flight.find params[:id ]
    plane = Airplane.find flight.airplane_id
    reservation = Reservation.where(flight_id: flight.id)
    current_seat = flight.reservations.count
    total_seat = flight.airplane.rows * flight.airplane.columns
    seat_cal = total_seat - current_seat
    if flight
      render json: {flight: flight, plane: plane, reservation: reservation, available_seat: seat_cal}
    else
      render json: { error: "No details found"}
    end
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
      plane = []
  
      flights.each do |f|
        plane.push(f.airplane)  
      end
      
        render json: {flight: flights ,plane: plane}

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
