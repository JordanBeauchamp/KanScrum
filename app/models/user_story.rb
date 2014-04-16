class UserStory < ActiveRecord::Base
  has_many :tasks
end
