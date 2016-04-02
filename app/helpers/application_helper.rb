module ApplicationHelper
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def authenticate_user
		if session[:user_id]
			@current_user ||=User.find(session[:user_id])
			redirect_to :back
		else
			redirect_to "#",notice:"You have to Log In to Perform this Action!"
		end
	end

	def user_signed_in?
		if session[:user_id]
			return true
		else
			false
		end
	end
end
