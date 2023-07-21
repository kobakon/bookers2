class ApplicationController < ActionController::Base
  # Deviseの初期設定root_pathを上書きする～～～～
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)  #サインイン後にbooksに遷移させる
    books_path                          #変更要）　ユーザページ  
  end
  
  def after_sign_out_path_for(resource)  #サインアップ後にAboutに遷移させる
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # ～～～～～～～ここまで
end
