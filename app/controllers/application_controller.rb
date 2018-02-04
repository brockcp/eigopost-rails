class ApplicationController < ActionController::Base

  include Pundit

  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: [:landing, :about, :index, :show]

  before_action :configure_permitted_parameters, if: :devise_controller? # add username to Devise

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password) }
    end

    layout :layout

  private

  def layout
    # only turn it off for login pages:
    # is_a?(Devise::SessionsController) ? false : "application"
    # or turn layout off for every devise controller:
     !devise_controller? && "application"
  end

end
