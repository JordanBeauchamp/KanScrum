class UserStoriesController < ApplicationController

	def create
		@user_story = UserStory.new(user_story_params)
		if @user_story.save
      render 'show', :id => @user_story.id
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
  end

  private 
  def user_story_params
  	 params.require(:user_story).permit(:id, :title, :description, :criteria, :story_points, :priority, :estimated_hours)
  end

end
