class SiteController < ApplicationController
  def sites
    @sites = Site.all
  end
end
