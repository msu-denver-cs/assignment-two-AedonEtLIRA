class CarsController < ApplicationController
  def index
    @car = Car.new
    @cars = Car.all
  end

  def new
    @car = Car.new
    @carManufacturers = CarManufacturer.all
    @carParts = CarPart.all.map{ |part| [part.name, part.id] }
  end

  def create
    if !params.empty?
      _car = Car.new
      _car.vin = params[:car][:vin]
      _car.model = params[:car][:model]
      _car.make = params[:carManufacturer][:carManufacturerId]
      _carPart = params[:carPart][:carPartId]

      if _car.save
        _carToPart = CarToPart.new
        _carToPart.car = _car.id
        _carToPart.car_part = _carPart

        _carToPart.save

        redirect_to cars_path
      end
    end
  end

  def search
    _carParams = params[:searchParams]

    if _carParams.nil? or _carParams.empty?
      @cars = Car.all
      redirect_to car_path
    end

    # We want the character order from the search, but we also want lazy searching
    _regex = _carParams.chars.reject(&:empty?).join('+')
    @cars = Car.where("model REGEXP ?", _regex)
    redirect_to car_path
  end
end
