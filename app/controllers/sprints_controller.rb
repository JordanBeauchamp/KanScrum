class SprintsController < ApplicationController
  before_filter :set_cache_buster

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def index
	 @sprints = Sprint.all
  end

  def show
	 @sprint = Sprint.find(params[:id])
   @tasks = Hash.new

   # Create map of user stories and their tasks.
   @sprint.user_stories.each do |user_story|
    ready_tasks = user_story.tasks.select{ |task| task[:status] == TaskStatus::READY}
    in_progress_tasks = user_story.tasks.select{ |task| task[:status] == TaskStatus::IN_PROGRESS}
    done_tasks = user_story.tasks.select{ |task| task[:status] == TaskStatus::DONE}
    @tasks[user_story.id.to_s] = {'Ready' => ready_tasks, 'In Progress' => in_progress_tasks, 'Done' => done_tasks}
   end
  end

  def new
	 @sprint = Sprint.new	 
  end

  def create
	@sprint = Sprint.new(sprint_params)	
	if @sprint.save
		redirect_to @sprint
	else
		render new
	end
  end

  def destroy
  end

  private 
  def sprint_params
    params.require(:sprint).permit(:name)	
  end
end
