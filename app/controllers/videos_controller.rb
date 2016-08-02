class VideosController < ApplicationController
  before_action :set_video, only: [:show]

  def index
    @videos = Video.with_locale.visible.page(params[:page]).per(6)
  end

  def show

  end

  private
  def set_video
    @video = Video.with_locale.visible.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to videos_path
  end
end