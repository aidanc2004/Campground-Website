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

    # What user this reservation is for
    @reservation.user_id = current_user.id
    # Total price of reservation
    @reservation.total = helpers.get_total @reservation

    # Make sure that this doesn't overlap with another reservation
    if helpers.doesnt_overlap?(@reservation) && @reservation.save
      redirect_to site_reservation_path(id: @reservation.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @site = Site.find(params[:site_id])
    @reservation = @site.reservations.find(params[:id])

    # Make sure user is an admin or created reservation
    if !current_user.is_admin? || @reservation.user_id != current_user.id
      flash[:alert] = "Cannot edit this user's reservation."
      redirect_to :root
    end
  end

  def update
    @site = Site.find(params[:site_id])
    @reservation = @site.reservations.find(params[:id])

    # Make sure user is an admin or created reservation
    if !current_user.is_admin? || @reservation.user_id != current_user.id
      flash[:alert] = "Cannot edit this user's reservation."
      redirect_to :root
    end

    if @reservation.update(reservation_params)
      redirect_to :admin
    else
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    @site = Site.find(params[:site_id])
    @reservation = @site.reservations.find(params[:id])

    # Make sure user is an admin or created reservation
    if !current_user.is_admin? || @reservation.user_id != current_user.id
      flash[:alert] = "Cannot edit this user's reservation."
      redirect_to :root
    end

    @reservation.destroy

    redirect_to :admin
  end

  private
    def reservation_params
        params.require(:reservation).permit(:start, :end)
    end
end
