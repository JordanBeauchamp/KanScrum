class SprintController < ApplicationController
  def index
	@sprints = Sprint.all
  end

  def show
	@sprint = Sprint.find(:id)
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
