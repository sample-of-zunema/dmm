class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def after_sign_in_path_for(resource)
      if resource.class == AdminUser
        admin_root_path
      else
        dreams_top_path
      end
    end

    def configure_permitted_parameters
      if user_signed_in?
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
      end
    end

end
