class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.string :title
      t.text :description
      t.text :criteria
      t.integer :story_points
      t.integer :priority
      t.integer :estimated_hours

      t.timestamps
    end
  end
end
