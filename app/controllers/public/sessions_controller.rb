# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  
  random_number = []
  usable_number = "0123456789"
  max_length = 5
  while random_number.length != max_length do
    number = usable_number[rand(usable_number.length)]
    
  
  # ランダムで生成した文字を格納する配列
random_pass_str = []
# パスワードに使用できる文字を定義
usable_char = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
# パスワードの長さを設定
PASS_LENGTH = 12
# 配列の要素数がパスワードの長さに達するまで繰り返す
while random_pass_str.length != PASS_LENGTH do
  # 使用できる文字からランダムに一文字抽出
  char = usable_char[rand(usable_char.length)]
  # 配列に追加
  random_pass_str.push(char)
end
# 抽出した文字列たちを連結させる
generated_pass = random_pass_str.join
p "パスワードを生成しました：" + generated_pass




  def guest_login
    User.create!(
      email: "guest@exam.com",
      password: "guestpass",
      name: "ゲスト",
      telephone_number: "00000000000",
      address: 1,
      category_medium_id: 1,
      occupation_id: 1,
      display_status: true,
      valid_status: true
    )
    sign_in guest
    redirect_to public_my_page_path
  end
  
  

  def after_sign_in_path_for(resource)
    public_my_page_path
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
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
