class AirplanesController < ApplicationController
  def new
    @airplane = Airplane.new
  end

  def create
    Airplane.create airplane_params

    redirect_to airplanes_path
  end

  def index
    @airplanes = Airplane.all
  end

  def show
    @airplane = Airplane.find params[:id]
    @row = 1
    @column = 0
    @column_letters = ('A'..'Z').to_a
  end

  def edit
    @airplane = Airplane.find params[:id]
  end

  def update
    airplane = Airplane.find params[:id]
    airplane.update! airplane_params
    redirect_to airplane_path(params[:id])
  end

  def destroy
    Airplane.destroy params[:id]
    redirect_to airplanes_path
  end
  
  private
  
  def airplane_params
    params.require(:airplane).permit(:name, :rows, :columns)
  end


end