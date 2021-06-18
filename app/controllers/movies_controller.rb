class MoviesController < ApplicationController
  def index
    # If user enters a movie title that is multiple words, the api will only work if we add '-' in between each word --- api does not like spaces
    movie = params[:movie]
    movies = HTTP.get("http://www.omdbapi.com/?s=#{movie}&type=movie&apikey=#{Rails.application.credentials.omdb_api_key}")
    render json: movies.parse(:json)
  end

  def show
    movie_id = params[:id]
    movie = HTTP.get("http://www.omdbapi.com/?i=#{movie_id}&type=movie&plot=short&apikey=#{Rails.application.credentials.omdb_api_key}")
    render json: movie.parse(:json)
  end
end
