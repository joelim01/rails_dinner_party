class ReservationsController < ApplicationController

  def new
    @dinner = Dinner.find_by(id: params[:dinner_id])
    @reservation = @dinner.reservations.build(user_id: current_user.id)
  end

  def create
    @reservation = Reservation.create!(reservation_params)
    redirect_to user_reservations_path(current_user)
  end

  def index
    if params[:user_id]
      @reservations = Reservation.find_by(user_id: params[:user_id])
    else
      @reservations = Reservation.all
    end
  end

private

def reservation_params
  params.require(:reservation).permit(:dinner_id, :user_id, :party_of)
end

end
