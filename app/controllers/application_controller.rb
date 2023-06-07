class ApplicationController < ActionController::Base
  helper SessionsHelper
  helper_method :current_user

  def current_user 
    @_current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
