class StolenCarsController < ApplicationController

  def index
    @stolen_cars = StolenCar.all
  end

  def new
    @stolen_car = StolenCar.new
  end

  def create
    if allowed_parameters
       StolenCar.create(allowed_parameters)
      redirect_to stolen_cars_path
    else
      redirect_to new_stolen_car_path
    end
  end

  def show
    @stolen_car = StolenCar.find(params[:id])
  end

  def update
    @stolen_car = StolenCar.find(params[:id])
    @stolen_car.update_attributes(allowed_parameters)
    redirect_to stolen_cars_path
  end

  def destroy
    @stolen_car = StolenCar.find(params[:id])
    @stolen_car.destroy
    redirect_to stolen_cars_path
  end
  

  private

  def allowed_parameters
    params.require(:stolen_car).permit(:license)
  end

  

end
