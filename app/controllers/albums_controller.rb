class AlbumsController < ApplicationController

  def index
    @albums = Album.with_locale.visible.page(params[:page]).per(6)
  end
end