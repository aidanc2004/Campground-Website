class SitesController < ApplicationController
  def sites
    @sites = Site.all
  end
end
