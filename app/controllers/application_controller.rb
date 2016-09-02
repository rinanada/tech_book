class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!



  def configure_permitted_parameters
    # sign_inのときに、group_keyも許可する
      devise_parameter_sanitizer.permit(:sign_in, keys:[:password, :email])
    # sign_upのときに、group_keyも許可する
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
    #account_updateのときに、group_keyも許可する
      devise_parameter_sanitizer.permit(:account_update, keys:[:email, :firstname, :lastname])
  end

  def authenticate_admin_user!
    authenticate_user!

    # current_userはdevise提供のメソッドです。
    # 権限ユーザのroleについては、好きな方法でよいです。（自分の場合、has_roleメソッドで実装）
    unless current_user.has_role 'admin'
      flash[:alert] = "管理者用ページです。権限があるアカウントでログインしてください。"
      redirect_to root_path
    end
  end



end
