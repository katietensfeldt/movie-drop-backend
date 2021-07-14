class UsersController < ApplicationController
  before_action :authenticate_user, except: :create
  def index
    users = User.where("username LIKE ?", "%#{params[:search]}%")
    render json: users
  end

  def create
    response = Cloudinary::Uploader.upload(params[:image], resource_type: :auto, :transformation=>[
      {:gravity=>"center", :height=>500, :width=>500, :crop=>"thumb"},
      {:width=>500, :crop=>"fill"}
      ])
    cloudinary_url = response["secure_url"]
    user = User.new(
      name: params[:name],
      username: params[:username],
      image: cloudinary_url,
      email: params[:email],
      phone_number: params[:phone_number],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      if params[:phone_number]
        client = Twilio::REST::Client.new(Rails.application.credentials.twilio_account_sid, Rails.application.credentials.twilio_auth_token)
        from = "+1#{Rails.application.credentials.twilio_phone_number}"
        to = "+1#{params[:phone_number]}"

        client.messages.create(
          from: from,
          to: to,
          body: "Hello! Welcome to Movie Drop. If you would like to stop receiving notifications, please delete your number from your user profile page. Happy dropping!"
        )
      end
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
   
    user = User.find(params[:id])
    if current_user == user
      user.name = params[:name] || user.name
      user.username = params[:username] || user.username
      user.email = params[:email] || user.email
      if params[:image]
        response = Cloudinary::Uploader.upload(params[:image], resource_type: :auto, :transformation=>[
      {:gravity=>"center", :height=>500, :width=>500, :crop=>"thumb"},
      {:width=>500, :crop=>"fill"}
      ])
        cloudinary_url = response["secure_url"]
        user.image = cloudinary_url || user.image
      end
      user.phone_number = params[:phone_number] || user.phone_number
      if user.save
        render json: user
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {}, status: 401
    end
  end

  def destroy
    user = User.find(params[:id])
    if current_user == user
      user.delete
      user.all_friendships.destroy_all
      user.suggestions.destroy_all
      suggestions = Suggestion.where("sender_id = ?", params[:id])
      suggestions.destroy_all
      render json: {message: "User successfully destroyed"}
    else
      render json: {}, status: 401
    end
  end

end
