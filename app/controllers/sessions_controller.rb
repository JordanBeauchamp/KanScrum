class SessionsController < ApplicationController
  def login
  end

 	def login_attempt
 	 	user = User.validate_user(params[:name], params[:password])
 	 	if user
 	 		session[:user_id] = user.id
 	 		redirect_to(:action => "home")
 	   else
 	   	flash[:notice] = "Invalid username or password"
 	   	flash[:color] = "invalid"
 	   	redirect_to(:controller => "static_pages", :action => "home")
 	   end
 	end
	
	def destroy
	 	session[:user_id] = nil
	 	flash[:notice] = "Logged out."
	 	redirect_to(:controller => "static_pages", :action => "login")
 	 end

 	 def home
 	 	@current_user = current_user
 	 	flash[:notice] = "Hi, " << @current_user.name.capitalize << "!" 

 	 	@sprints = Sprint.where("user_id = ?", @current_user.id)
 	 end
end
