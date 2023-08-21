# Stores static pages
class PagesController < ApplicationController
  before_action :authenticate_user!, only: :admin

  def index
  end

  def rules
  end

  def contact
  end
end
