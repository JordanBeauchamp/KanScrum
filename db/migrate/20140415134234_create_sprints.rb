class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.string :name
      t.belongs_to :team

      t.timestamps
    end
  end
end
