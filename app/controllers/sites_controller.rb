class SitesController < ApplicationController

  before_action :set_site

  def show

  end

  private
  def set_site
    @site = Site.visible.find(params[:id])
  end

end
