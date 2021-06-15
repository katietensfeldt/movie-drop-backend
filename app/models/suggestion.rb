class Suggestion < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
  
  def movie
    response = HTTP.get("http://www.omdbapi.com/?i=#{omdb_api_id}&type='movie'&plot=short&apikey=#{Rails.application.credentials.omdb_api_key}")
    return response.parse(:json)
  end
end
