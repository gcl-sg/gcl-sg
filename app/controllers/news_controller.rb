class NewsController < ApplicationController

  def search
    @news = News.fulltext_search(params[:query], params[:page])
  end

end
