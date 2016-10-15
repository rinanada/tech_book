class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      # session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to root_path, flash: { error: "Facebookでの認証に失敗しました" }
    end
  end


  def twitter
    set_dummy_email
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      redirect_to root_path, flash: { error: "Twitterでの認証に失敗しました" }
    end
  end
end
