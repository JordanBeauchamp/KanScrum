class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.references :UserStory, index: true
      t.string :name

      t.timestamps
    end
  end
end
