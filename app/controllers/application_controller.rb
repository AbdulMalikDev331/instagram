# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action!'
    redirect_back(fallback_location: root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :fullname, { images: [] }, :profile_pic, :kind])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username fullname profile_pic kind])
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
