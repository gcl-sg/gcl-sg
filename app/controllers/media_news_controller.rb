class MediaNewsController < ApplicationController

  before_action :set_news, only: [:show]

  def index
    @news = News.with_locale.media.visible.page(params[:page])
  end

  def show

  end

  private
  def set_news
    @news = News.with_locale.media.visible.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to media_news_index_path
  end
end
