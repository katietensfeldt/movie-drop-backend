class SuggestionsController < ApplicationController
  before_action :authenticate_user
  def index
    suggestions = current_user.suggestions
    render json: suggestions
  end

  def create
    suggestion = Suggestion.new(
      sender_id: current_user.id,
      recipient_id: params[:recipient_id],
      omdb_api_id: params[:omdb_api_id]
    )
    if suggestion.save
      render json: suggestion
    else
      render json: {errors: suggestion.errors.full_messages}, status: :bad_request
    end
  end

  def update
    suggestion = current_user.suggestions.find(params[:id])
    suggestion.watched = params[:watched] || suggestion.watched
    if suggestion.save
      render json: suggestion
    else
      render json: {errors: suggestion.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    suggestion = current_user.suggestions.find(params[:id])
    suggestion.delete
    render json: {message: "Suggestion successfully deleted"}
  end
end
