# Stores static pages
class PagesController < ApplicationController
  before_action :authenticate_user!, only: :admin

  def index
  end

  def rules
  end

  def contact
  end

  # TODO: Maybe move from pages to its own controller?
  def admin
    # Make sure the user is an admin
    current_user.authenticate_admin

    @sites = Site.all
    @reservations = Reservation.all
    @users = User.all
  end
end
