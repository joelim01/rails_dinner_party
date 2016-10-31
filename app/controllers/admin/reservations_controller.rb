class Admin::ReservationsController < ApplicationController
  before_filter :admin_only

  def index
    @dinners_future = Dinner.in_the_future.order('date DESC')
    @dinners_past = Dinner.in_the_past.order('date DESC')
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to admin_reservations_path, flash: {:message => "Reservation cancelled."}
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      respond_to do |f|
        f.html { redirect_to admin_reservations_path, flash: {:message => "Reservation updated." }
        f.json { render json: @reservation }
      end
    else
      render :edit
    end
  end

  def reservation_params
    params.require(:reservation).permit(:party_of, :dinner_id)
  end

end
