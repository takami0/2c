# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :valid_status_check, only: [:create]

  def guest_login
    get_random = SecureRandom.alphanumeric(6)
    guest = User.create!(
      category_medium_id: 1,
      occupation_id: 1,
      name: "ゲスト#{get_random}",
      email: "#{get_random}@exam.com",
      password: "#{get_random}",
      telephone_number: "#{SecureRandom.alphanumeric(11)}",
      address: 1,
      member_status: 2,
      display_status: true,
      valid_status: true
    )
    sign_in guest
    redirect_to public_top_path
  end

  def after_sign_in_path_for(resource)
    public_user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

  def valid_status_check
    @user = User.find_by(email: params[:user][:email])
    if !@user
      render :new
      #redirect_to new_user_registration_path
    else
      if @user.valid_password?(params[:user][:password]) && @user.valid_status == false
        render :new
      end
    end
  end
end
