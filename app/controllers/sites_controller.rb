class SitesController < ApplicationController
  def sites
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
  end

  def new
    # Make sure user is an admin
    if !current_user.is_admin?
      flash[:alert] = "Must be an admin to view this page."
      redirect_to :root
    end

    @site = Site.new
  end

  def create
    # Make sure user is an admin
    if !current_user.is_admin?
      flash[:alert] = "Must be an admin to view this page."
      redirect_to :root
    end

    @site = Site.new(site_params)

    if @site.save
      redirect_to sites_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # Make sure user is an admin
    if !current_user.is_admin?
      flash[:alert] = "Must be an admin to view this page."
      redirect_to :root
    end

    @site = Site.find(params[:id])
    @site.destroy
  end

  private
    def site_params
      params.require(:site).permit(:name, :number, :beds, :price)
    end
end
