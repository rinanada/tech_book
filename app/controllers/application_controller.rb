class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?



  def configure_permitted_parameters
    # sign_inのときに、group_keyも許可する
      devise_parameter_sanitizer.permit(:sign_in, keys:[:username, :password])
    # sign_upのときに、group_keyも許可する
      devise_parameter_sanitizer.permit(:sign_up, keys:[:username, :email])
    #account_updateのときに、group_keyも許可する
      devise_parameter_sanitizer.permit(:account_update, keys:[:username])
  end


  # def after_sign_in_path_for(resource)
  #   binding.pry
  #   root_path
  # end

  # def after_sign_out_path_for(resource)
  #   admin_root_path
  # end
end
