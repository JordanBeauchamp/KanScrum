class UserStory < ActiveRecord::Base
  default_scope { order('priority ASC') }

  has_many :tasks
  belongs_to :sprint
end
