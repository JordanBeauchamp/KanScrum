class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :hours
      t.belongs_to :user
      t.belongs_to :user_story

      t.timestamps
    end
  end
end
