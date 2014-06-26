class UserStoriesController < ApplicationController

	def create
		@user_story = UserStory.new(user_story_params)
		if @user_story.save
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
  end

  private 
  def user_story_params
  	 params.require(:user_story).permit(:id, :title, :description, :criteria, :story_points, :priority, :estimated_hours, :sprint_id)
  end

end
