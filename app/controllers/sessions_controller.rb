class SessionsController < ApplicationController

	before_filter :save_login_state, :only => [:login_attempt]

	def home
 	 	@current_user = current_user
 	 	flash[:notice] = "Hi, " << @current_user.name.capitalize << "!"

 	 	# Collect this users  sprints.
 	 	@sprints = Sprint.where("user_id = ?", @current_user.id)
 	end

 	def login_attempt
 	 	user = User.validate_user(params[:name], params[:password])
 	 	if user
 	 		session[:user_id] = user.id
 	 		redirect_to(:action => "home")
 	   else
 	   	flash[:notice] = "Invalid Username or Password."
 	   	redirect_to(:controller => "static_pages", :action => "home")
 	   end
 	end
	
	def destroy
	 	session[:user_id] = nil
	 	flash[:notice] = "Logout Successful."
	 	redirect_to(:controller => "static_pages", :action => "home")
 	end
end
