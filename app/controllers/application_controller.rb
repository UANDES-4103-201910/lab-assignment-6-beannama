class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
	#complete this method
    @current_user ||= session[:current_user_id] &&
        User.find_by_id(session[:current_user_id])
  end

  def is_user_logged_in?
	#complete this method
    logged_in = false
    if current_user
      logged_in = true
    end
	    if logged_in then true else redirect_to root_path end
  end
end
