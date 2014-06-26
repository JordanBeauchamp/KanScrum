KanScrum::Application.routes.draw do

	root 'sprints#new'
	post "/", :to => "sprints#create"

  resources :users
  resources :tasks
  resources :sprints
  resources :user_stories
  post "tasks/new", :to => "tasks#create"
  post "sprints/new", :to => "sprints#create"
  post "user_stories/new", :to => "user_stories#create"
  post '/tasks/update_status/:id&:task_status', to: 'tasks#update_status'


end
