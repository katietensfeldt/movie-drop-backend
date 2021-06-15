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
        render json: friendship
      else
        render json: {errors: friendship.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {}, status: 401
    end
  end

  def destroy
    friendship = Friendship.find(params[:id])
    if current_user.all_friendships.include?(friendship)
      friendship.delete
      render json: {message: "Friendship successfully deleted"}
    else
      render json: {}, status: 401
    end
  end

end
