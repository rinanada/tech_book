class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  def new
    # binding.pry
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    # respond_with(resource, serialize_options(resource))
    redirect_to root_path
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    # binding.pry
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    redirect_to root_path
    # respond_with resource, location: after_sign_in_path_for(resource)
    # reset_session
  end


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
