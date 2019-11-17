class CarPartsController < ApplicationController
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
end
