class ApplicationController < ActionController::Base
  before_action :authenticate_business_account!

  

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:business_name])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:business_name])
  end
end
