class TasksController < ApplicationController
	skip_before_filter  :verify_authenticity_token, :only => [:update_status, :assign_user]
	
	include ApplicationHelper

	# Ajax method for assigning user to a task.
	def assign_user
		task = Task.find_by_id(params[:id])
		task.update(:user_id => params[:user_id], :user_name => User.find(params[:user_id]).name)
		
		# Return json payload.
		payload = {
 			data: task.user_name,
  		status: 200
		}
		render :json => payload, :status => :ok
	end

	def new
		@task = Task.new
	end

	def create 
		@task = Task.new(task_params) 
		if @task.save
			redirect_to :controller => "user_stories", :action => "show", :id => @task.user_story_id
		else
			render 'new'
		end
	end	
	
	def index
		@tasks = Task.all
	end

	def show
		@task = Task.find(params[:id])
	end

	# Ajax method to update task status from view.
	def update_status
		task = Task.find_by_id(params[:id])
		task_status = params[:task_status]
		if(task_status == "Ready")
			task.update(:status => TaskStatus::READY)
		elsif(task_status == "InProgress")
			task.update(:status => TaskStatus::IN_PROGRESS)
		elsif (task_status == "Done")
			task.update(:status => TaskStatus::DONE)
		end
		render json: task
	end

	private
	def task_params
		params.require(:task).permit(:description, :hours, :task_type, :user_id, :user_story_id)
	end
end
