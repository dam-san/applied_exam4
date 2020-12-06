class ApplicationController < ActionController::Base
#   before_action :authenticate_user!
# 	before_action :configure_permitted_parameters, if: :devise_controller?

#   protected
#   def after_sign_in_path_for(resource)
#     root_path
#   end

#   def after_sign_out_path_for(resource)
#     root_path
#   end

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
#   end
  
  # ---------------------
  
  before_action :authenticate_user!,except: [:top, :about]
  # ログインするまではtopとabout以外はアクセスでけへんようにする。
  before_action :configure_permitted_parameters, if: :devise_controller?
    
    # サインイン後　のアクションを定義
    def after_sign_in_path_for(resource)
    user_path(resource)
    end
    
    # ログイン後　のアクションを定義
    def after_log_in_path_for(resource)
    user_path(resource)
    end
    
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
  
end
