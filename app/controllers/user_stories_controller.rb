class UserStoriesController < ApplicationController

skip_before_filter  :verify_authenticity_token, :only => [:update_priority]
  
	def create
		@user_story = UserStory.new(user_story_params)
		if @user_story.save
      puts "*****WE SHOULDNT BE HERE ****"
      redirect_to :controller => "sprints", :action => "show", :id => @user_story.sprint_id
    else
			render 'new'
		end
	end

  def edit
  end

  def index
  	@user_stories = UserStory.all
  end

  def new
  	@user_story = UserStory.new
  end

  def show
  	@user_story = UserStory.find(params[:id])
    @tasks_ready = @user_story.tasks.select{ |task| task[:status] == TaskStatus::READY}
    @tasks_in_progress = @user_story.tasks.select{ |task| task[:status] == TaskStatus::IN_PROGRESS}
    @tasks_done = @user_story.tasks.select{ |task| task[:status] == TaskStatus::DONE}
    estimated_hours = @tasks_ready.to_a.sum(&:hours)
    estimated_hours = 0 unless estimated_hours
    @user_story.estimated_hours = estimated_hours
    @user_story.save
  end
  
  # Post method for updating user story priority.
  def update_priority
		data = params[:_json]
		
		# Itearate json object and update userStory priority.
		data.each do |set|
			userStory = UserStory.find(set['id'].to_i)
			userStory.update(:priority => set['priority'].to_s)
		end
	
		# Return json payload.
		payload = 
		{
			data: "success",
			status: "success"
		}
		render :json => payload, :status => :ok    
  end


  private 
  def user_story_params
  	 params.require(:user_story).permit(:id, :title, :description, :criteria, :story_points, :priority, :estimated_hours, :sprint_id)
  end

end
