class NewsController < ApplicationController

  def search
    @is_on_searching = true
    @news = News.fulltext_search(params[:query], params[:page])
  end

end
