class CarManufacturersController < ApplicationController
  def index
    if params[:searchParams]
      @searchParams = params[:searchParams]
      find_manufacturers_by_search_params
    else
      @searchParams = ""
      @carManufacturer = CarManufacturer.new
      @carManufacturers = CarManufacturer.all
    end
  end

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

  def find_manufacturers_by_search_params
    _regex = @searchParams.chars.reject(&:empty?).join('+')
    manfacs = []

    Car.all.each do |manfac|
      if manfac.name.match(_regex) or manfac.country.match(_regex)
        manfacs.append manfac
      end
    end

    @cars = manfacs
  end
end
