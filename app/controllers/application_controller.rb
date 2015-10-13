class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?
  def current_user
    # Use the logger for debug messages, not the flash
    # logger.fatal("Oh shit it busted")
    # logger.info("Requested current user")
    if logged_in? # Separate concerns
      @user ||= User.find(session[:user_id])
    end
    # if session[:user_id]
    #   User.find(session[:user_id])
    # else
    #   nil
    # end
  end

  def logged_in?
    !!session[:user_id] # Ensure you are returning a True/False value
    # session[:user_id]
  end

end
