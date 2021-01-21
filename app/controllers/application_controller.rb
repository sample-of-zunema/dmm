class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    # 管理者でログインした場合
    if resource.instance_of?(AdminUser)
      admin_root_path
    else
      # そうでなければdream sharingのトップページへ
      dreams_top_path
    end
  end

  def configure_permitted_parameters
    if user_signed_in?
      # 新規登録で名前とメールアドレスが必須
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email])
      # ログイン時に名前でログインできるように
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
      # 編集時に名前が必須
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
  end
end
