class AddSprintToUserStory < ActiveRecord::Migration
  def change
    add_reference :user_stories, :sprint, index: true
  end
end
