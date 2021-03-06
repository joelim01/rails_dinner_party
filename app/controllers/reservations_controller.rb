class ReservationsController < ApplicationController

  def new
    @dinner = Dinner.find_by(id: params[:dinner_id])
    @reservation = @dinner.reservations.find_or_initialize_by(user_id: current_user.id)
    if @reservation.persisted?
      redirect_to user_reservations_path(current_user), :flash => { :error => "You already have a reservation for this event." }
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.save
    redirect_to user_reservations_path(current_user)
  end

  def index
    if params[:dinner_id]
      @reservations = Reservation.where(dinner_id: params[:dinner_id])
    elsif current_user
      @reservations = Reservation.where(user_id: current_user.id)
    else
      @reservations = Reservation.all
    end
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @reservations}
    end
  end

  def update
    @reservation = Reservation.find_by(user_id: current_user.id, dinner_id: params[:reservation][:dinner_id])
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
    params.require(:reservation).permit(:dinner_id, :party_of)
  end

end
