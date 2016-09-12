class ReservationsController < ApplicationController

  def new
    @dinner = Dinner.find_by(id: params[:dinner_id])
    @reservation = @dinner.reservations.find_or_initialize_by(user_id: current_user.id)
    if @reservation.persisted?
      redirect_to user_reservations_path(current_user), :flash => { :error => "You already have a reservation for this event." }
    end
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

  def update
    @reservation = Reservation.find_by(user_id: params[:reservation][:user_id], dinner_id: params[:reservation][:dinner_id])
    if @reservation.update(party_of: params[:reservation][:party_of])
      redirect_to user_reservations_path(current_user), :flash => { :message => "Your reservation has been updated." }
    else
      render "index"
    end
  end

  def destroy
    @reservation = Reservation.find_by(reservation_params)
    @reservation.destroy
    redirect_to user_reservations_path(current_user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:dinner_id, :user_id, :party_of)
  end

end
