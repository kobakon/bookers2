class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  
  # Deviseの初期設定root_pathを上書きする～～～～
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)  #サインイン後にユーザーページに遷移させる
    user_path(current_user.id)  
  end
  
  def after_sign_out_path_for(resource)  #サインアップ後にに遷移させる
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  # ～～～～～～～ここまで
end
