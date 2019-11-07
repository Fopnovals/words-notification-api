require 'json_web_token'

class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      set_user_device_id
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     first_name: @user.first_name, last_name: @user.last_name, role: @user.role, image: @user.photo_url }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password, :device_id)
  end

  def set_user_device_id
    if params[:device_id]
      does_not_exists_device_id = @user.devices_ids.exclude?(params[:device_id])
      does_not_exists_device_id && @user.update(devices_ids: @user.devices_ids.push(params[:device_id]))
    end
  end
end
