class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def index
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def show
 		@user = User.find(params[:id])
	end

	def destory
		@user = User.find(params[:id])
		@user.destory
	end

	private 
	def user_params
		params.require(:user).permit(:name, :password, :email)
	end
end
