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
      if suggestion.recipient.phone_number
        client = Twilio::REST::Client.new(Rails.application.credentials.twilio_account_sid, Rails.application.credentials.twilio_auth_token)
        from = "+1#{Rails.application.credentials.twilio_phone_number}"
        to = "+1#{suggestion.recipient.phone_number}"

        client.messages.create(
          from: from,
          to: to,
          body: "Hello from Movie Drop! You have received new movie suggestion from #{suggestion.sender.username}. Check your list to see what it is."
        )
      end
      render json: suggestion
    else
      render json: {errors: suggestion.errors.full_messages}, status: :bad_request
    end
  end

  def update
    suggestion = current_user.suggestions.find(params[:id])
    suggestion.watched = !suggestion.watched
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
