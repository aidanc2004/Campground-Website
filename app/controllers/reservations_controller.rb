class ReservationsController < ApplicationController
  def new
    @site = Site.find(params[:site_id])
    @reservation = @site.reservations.new
  end

  def create
  end

  private
    def reservation_params
        params.require(:reservation).permit(:name, :start, :end)
    end
end
