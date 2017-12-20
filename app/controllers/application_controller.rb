class ApplicationController < ActionController::Base
	include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	private

	  def user_not_authorized
	    flash[:alert] = 'You are not authorized to perform this action.'
	    redirect_to(request.referer || root_path)
	  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :first_name, :last_name, :is_female, :date_of_birth, :country])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :first_name, :last_name, :is_female, :date_of_birth, :country])
  end
end
