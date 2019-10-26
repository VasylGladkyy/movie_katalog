class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:warning] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[nickname profile_image])
  end
end
