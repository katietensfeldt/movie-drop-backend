class UsersController < ApplicationController
  before_action :authenticate_user, except: :create
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(
      name: params[:name],
      username: params[:username],
      image: params[:image],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
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
      user.image = params[:image] || user.image
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
      render json: {message: "User successfully destroyed"}
    else
      render json: {}, status: 401
    end
  end

end
