class AddSprintsToTeam < ActiveRecord::Migration
  def change
    add_reference :teams, :sprint, index: true
  end
end
