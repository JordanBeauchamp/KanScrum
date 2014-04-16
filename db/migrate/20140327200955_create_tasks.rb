class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :hours
      t.references :user, index: true
      t.references :user_story, index: true

      t.timestamps
    end
  end
end
