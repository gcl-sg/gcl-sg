module NewsHelper
  def resolve_news_path(news)
    eval("#{news.category}_news_path(news)")
  end
end