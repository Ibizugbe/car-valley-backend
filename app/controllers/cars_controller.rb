class CarsController < ApplicationController
  before_action :authorize
  before_action :set_car, only: %i[show update destroy]

  # GET /cars
  def index
    @cars = Car.all

    render json: @cars, include: :reservations
  end

  # GET /cars/1
  def show
    if @car
      render json: { data: @car, status: 'success' }
    else
      render json: { error: 'Car not found', status: 'failure' }, status: :unprocessable_entity
    end
  end

  # POST /cars
  def create
    @car = Car.create(car_params)

    if @car
      render json: { data: @car, status: 'success' }, status: :created
    else
      render json: { error: @car.errors, status: 'failure' }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cars/1
  def update
    if @car.update(car_params)
      render json: { data: @car, status: 'success' }
    else
      render json: { error: @car.errors, status: 'failure' }, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1
  def destroy
    if @car
      if @car.destroy
        render json: { deleted: @car, status: 'success' }
      else
        render json: { error: "Can't delete the Car" }, status: :unprocessable_entity
      end
    else
      render json: { message: 'Car not found', status: 'failure' }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.permit(:model, :color, :image, :price, :description, :release_date)
  end
end
