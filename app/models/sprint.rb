class Sprint < ActiveRecord::Base
  has_many :user_stories
  belongs_to :team
end
