Task.create(:id => 1, :description => "Analyse requirements.", :hours => 3, :user_story_id => 1, :task_type => "Design", :status => "Ready")
Task.create(:id => 2, :description => "Implement data structure in database.", :hours => 2, :user_id => 2, :user_story_id => 1, :task_type => "Development", :status => "Done", :user_name => "Tester")
Task.create(:id => 3, :description => "Normalise data model design.", :hours => 2, :user_id => 2, :user_story_id => 1, :task_type => "Design", :status => "Ready", :user_name => "Tester")
