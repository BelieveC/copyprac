class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

 def authenticate_user
 	if session[:user_id]
 		@current_user ||=User.find(session[:user_id])
 	else
 		redirect_to "#",notice:"You have to Log In to Perform this Action!"
 	end
 end
end
