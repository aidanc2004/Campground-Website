class ReservationsController < ApplicationController
  def new
    @site = Site.find(params[:site_id])
    @reservation = @site.reservations.new
  end

  def create
    @site = Site.find(params[:site_id])
    @reservation = @site.reservations.create(reservation_params)
    # todo: errors and error handling
    if @reservation.save
      redirect_to sites_path
    end
  end

  private
    def reservation_params
        params.require(:reservation).permit(:name, :start, :end)
    end
end
