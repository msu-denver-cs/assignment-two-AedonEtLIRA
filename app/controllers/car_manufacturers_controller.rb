class CarManufacturersController < ApplicationController
  def new
    @carManufacturer = CarManufacturer.new
    @carManufacturers = CarManufacturer.all
  end

  def create
    @carManufacturerParams = params[:car_manufacturer]
    @carManufacturer = CarManufacturer.new
    @carManufacturer.name = @carManufacturerParams[:name]
    @carManufacturer.country = @carManufacturerParams[:country]

    if @carManufacturer.save
      redirect_to new_car_manufacturer_path
    end
  end
end
