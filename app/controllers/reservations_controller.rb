class ReservationsController < ApplicationController
  before_action :authorize
  before_action :set_reservation, only: %i[show update destroy]

  # GET /users/:user_id/reservations
  def index
    @reservations = Reservation.where(user_id: params[:user_id])

    render json: @reservations, include: :car
  end

  # POST /users/:user_id/reservations
  def create
    @reservation = Reservation.create(reservation_params)

    if @reservation
      render json: { data: @reservation, status: 'success' }, status: :created
    else
      render json: { error: @reservation.errors, status: 'failure' }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/:user_id/reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: { data: @reservation, status: 'success' }
    else
      render json: { error: @reservation.errors, status: 'failure' }, status: :unprocessable_entity
    end
  end

  # DELETE /users/:user_id/reservations/1
  def destroy
    if @reservation
      if @reservation.destroy
        render json: { deleted: @reservation, status: 'success' }
      else
        render json: { error: "Can't delete the Car" }, status: :unprocessable_entity
      end
    else
      render json: { message: 'Car not found', status: 'failure' }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:car_id, :date, :city).merge(user_id: params[:user_id])
  end
end
