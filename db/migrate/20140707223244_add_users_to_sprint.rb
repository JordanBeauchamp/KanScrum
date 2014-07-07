class AddUsersToSprint < ActiveRecord::Migration
  def change
    add_reference :sprints, :user, index: true
  end
end
