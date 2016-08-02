module NewsHelper
  def reslove_news_path(news)
    eval("#{news.category}_news_path(news)")
  end
end