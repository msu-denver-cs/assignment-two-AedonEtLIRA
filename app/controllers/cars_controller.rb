class CarsController < ApplicationController
  def new
    @car = Car.new
    @carManufacturers = CarManufacturer.all
    @carParts = CarPart.all.map{ |part| [part.name, part.id] }
  end

  def create
    @carParams = params[:carManufacturer]
    if @carParams != nil
      @car = Car.new
      @carModel = @carParams[:model]
      @carManufacturer = @carParams[:carManufacturerId]
      @carVin = @carParams[:carVin]
      @carPart = @carParams[:carPartId]
      if @car.save
        redirect_to new_car_path
      end
    end
  end
end
