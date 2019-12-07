class CarPartsController < ApplicationController
  def index
    if params[:searchParams]
      @searchParams = params[:searchParams]
      find_parts_by_search_params
    else
      @searchParams = ""
      @carPart = CarPart.new
      @carParts = CarPart.all
    end
  end

  def new
    @carPart = CarPart.new
    @carParts = CarPart.all
  end

  def create
    @carPartParams = params[:car_part]
    @carPart = CarPart.new
    @carPart.name = @carPartParams[:name]
    @carPart.description = @carPartParams[:description]

    if @carPart.save
      redirect_to new_car_path
    end
  end

  def find_parts_by_search_params
    _regex = params[:searchParams].chars.reject(&:empty?).join('+')
    _parts = []

    CarPart.all.each do |part|
      if part.name.match(_regex) or part.description.match(_regex)
        _parts.append part
      end
    end

    @carParts = _parts
  end
end
