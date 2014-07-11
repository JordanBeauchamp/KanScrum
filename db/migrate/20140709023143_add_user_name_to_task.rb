class AddUserNameToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :user_name, :string
  end
end
