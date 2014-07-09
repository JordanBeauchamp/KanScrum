module ApplicationHelper
	def task_types
		["Design", "Development", "Documentation", "Spike", "Test"]
	end

	def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
end
end
