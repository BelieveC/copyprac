class SessionsController < ApplicationController
	def create
	    user = User.from_omniauth(env["omniauth.auth"])
	    session[:user_id] = user.id
	    redirect_to practicals_path,notice:"Successfully Signed In"
	end

	def destroy
		session[:user_id] = nil
	    redirect_to root_path,notice:"Logged Out"
	end
end
