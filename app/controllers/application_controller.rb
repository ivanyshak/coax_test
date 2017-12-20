class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :first_name, :last_name, :is_female, :date_of_birth, :country])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :first_name, :last_name, :is_female, :date_of_birth, :country])
  end
end
