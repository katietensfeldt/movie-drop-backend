class MoviesNewsController < ApplicationController
  def index
    articles = HTTP.get("https://newsapi.org/v2/everything?q=movies&language=en&sortBy=publishedAt&pageSize=15&apiKey=#{Rails.application.credentials.news_api_key}")
    render json: articles.parse(:json)['articles']
  end
end
