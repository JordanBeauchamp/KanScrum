class Task < ActiveRecord::Base
	before_create :set_defaults

	# Associations
	has_one :user
	belongs_to :user_story

	# Set default values for this model before save.
	def set_defaults
		self.status = TaskStatus::READY
	end

end
