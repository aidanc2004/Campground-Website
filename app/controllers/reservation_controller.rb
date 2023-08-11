class ReservationController < ApplicationController
  def new
    @site = Site.find(params[:id])
  end
end
