class CarsController < ApplicationController
  helper_method :get_manufacturer

  def index
    if params[:searchParams]
      @searchParams = params[:searchParams]
      find_cars_by_search_params
    else
      @car = Car.new
      @cars = Car.all
      @searchParams = ""
    end
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

  def get_manufacturer(id)
    CarManufacturer.find(id).name
  end

  def find_cars_by_search_params
    _regex = @searchParams.chars.reject(&:empty?).join('+')
    _cars = []

    Car.all.each do |car|
      _make = get_manufacturer car.make
      if car.model.match(_regex) or _make.match(_regex)
        _cars.append car
      end
    end

    @cars = _cars
  end
end
