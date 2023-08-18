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

  def edit
    # Make sure user is an admin
    if !current_user.is_admin?
      flash[:alert] = "Must be an admin to view this page."
      redirect_to :root
    end

    @site = Site.find(params[:id])
  end

  def update
    # Make sure user is an admin
    if !self.is_admin?
      flash[:alert] = "Must be an admin to view this page."
      redirect_to :root
    end

    @site = Site.find(params[:id])

    if @site.update(site_params)
      redirect_to :admin
    else
      render :update, status: :unprocessable_entity
    end
  end

  def create
    # Make sure user is an admin
    if !self.is_admin?
      flash[:alert] = "Must be an admin to view this page."
      redirect_to :root
    end

    @site = Site.new(site_params)

    if @site.save
      redirect_to :admin
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # Make sure user is an admin
    if !self.is_admin?
      flash[:alert] = "Must be an admin to view this page."
      redirect_to :root
    end

    @site = Site.find(params[:id])
    @site.destroy

    redirect_to :admin
  end

  private
    def site_params
      params.require(:site).permit(:name, :number, :beds, :price)
    end
end
