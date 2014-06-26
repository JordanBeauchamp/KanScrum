class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.string :name

      t.timestamps
    end
  end
end
