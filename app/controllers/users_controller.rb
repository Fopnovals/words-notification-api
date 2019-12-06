# frozen_string_literal: true

require 'json_web_token'

class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: { first_name: @user.first_name, last_name: @user.last_name, role: @user.role, image: @user.photo_url }, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{id}
  def update
    @user = User.find(params[:id])
    if @user.update(update_user_params)
      user = @user.as_json(except: [:password_digest])
      render json: user, status: :ok
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end

  private

  def find_user
    if params[:id] == 'me'
      user = @current_user.as_json(except: [:password_digest])
      render json: user, status: :ok
    else
      begin
        @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
      end
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :device_id)
  end

  # def user_by_token
  #   header = request.headers['Authorization']
  #   header = header.split(' ').last if header
  #   decoded = JsonWebToken.decode(header)
  #   User.find(decoded[:user_id])
  # end
end
