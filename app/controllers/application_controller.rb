class ApplicationController < ActionController::Base

  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:landing, :about] #guest allowed to view index and about

end
