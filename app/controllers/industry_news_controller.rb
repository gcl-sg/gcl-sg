class IndustryNewsController < ApplicationController

  before_action :set_news, only: [:show]

  def index
    @news = News.with_locale.industry.visible.page(params[:page])
  end

  def show

  end

  private
  def set_news
    @news = News.with_locale.industry.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to industry_news_index_path
  end
end
