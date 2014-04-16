class Task < ActiveRecord::Base
	has_one :user
	belongs_to :user_story
end
