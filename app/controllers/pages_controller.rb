# Stores static pages
class PagesController < ApplicationController
  before_action :authenticate_user!, only: :admin

  def index
  end

  def rules
  end

  def contact
  end

  def admin
    # Make sure the user is an admin
    if !current_user.is_admin?
      flash[:alert] = "Must be an admin to view this page."
      redirect_to :root
    end

    @sites = Site.all
    @reservations = Reservation.all
    @users = User.all
  end
end
