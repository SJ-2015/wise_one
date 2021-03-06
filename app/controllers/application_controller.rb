class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :current_user
  include SessionsHelper

  protect_from_forgery with: :exception


end
