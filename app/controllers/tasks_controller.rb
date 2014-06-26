class TasksController < ApplicationController
	
	include ApplicationHelper

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
		@task = task.find(params[:id])
	end

	# Ajax method to update task status from view.
	def update_status
		task = Task.find(params[:id])
		task_status = params[:status]
		if(task_status == "ready")
			task.status = TaskStatus::READY
		elsif(task_status == "inprogress")
			task.status = TaskStatus::IN_PROGRESS
		elsif (task_status == "done")
			task.status = TaskStatus::DONE
		end
		task.save
		render json: task
	end

	private
	def task_params
		params.require(:task).permit(:description, :hours, :task_type, :user_id, :user_story_id)
	end
end
