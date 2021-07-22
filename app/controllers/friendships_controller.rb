class FriendshipsController < ApplicationController
  before_action :authenticate_user

  def index
    friendships = current_user.all_friendships
    render json: friendships
  end

  def create
    # autopopulate the sender_id with the current user id
    friendship = Friendship.new(
      sender_id: current_user.id,
      recipient_id: params[:recipient_id]
    )
    if friendship.save
      if friendship.recipient.phone_number
        client = Twilio::REST::Client.new(Rails.application.credentials.twilio_account_sid, Rails.application.credentials.twilio_auth_token)
        from = "+1#{Rails.application.credentials.twilio_phone_number}"
        to = "#{friendship.recipient.phone_number}"

        client.messages.create(
          from: from,
          to: to,
          body: "Hello from Movie Drop! You have received a friendship request! Check your account to see who it is."
        )
      end
      render json: friendship
    else
      render json: { errors: friendship.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    # User may only change the confirmed status, and only of the friendship request they are a recipient
    friendship = Friendship.find(params[:id])
    if friendship.recipient == current_user
      friendship.confirmed = params[:confirmed] || friendship.confirmed
      if friendship.save
        if friendship.sender.phone_number
          client = Twilio::REST::Client.new(Rails.application.credentials.twilio_account_sid, Rails.application.credentials.twilio_auth_token)
          from = "+1#{Rails.application.credentials.twilio_phone_number}"
          to = "+1#{friendship.sender.phone_number}"
  
          client.messages.create(
            from: from,
            to: to,
            body: "Hello from Movie Drop! You have a newly confirmed friendship from #{friendship.recipient.username}. You may now send them movie suggestions."
          )
        end
        render json: friendship
      else
        render json: {errors: friendship.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {}, status: 401
    end
  end

  def destroy
    friendship = current_user.all_friendships.find(params[:id])
    friendship.delete
    render json: {message: "Friendship successfully deleted"}
  end

end
