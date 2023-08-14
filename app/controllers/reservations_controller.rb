class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @site = Site.find(params[:site_id])
    @reservation = @site.reservations.new
  end

  def create
    @site = Site.find(params[:site_id])
    @reservation = @site.reservations.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.total = helpers.get_total @reservation

    if @reservation.save
      redirect_to site_reservation_path(id: @reservation.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def reservation_params
        params.require(:reservation).permit(:start, :end)
    end
end
