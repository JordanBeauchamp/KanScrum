KanScrum::Application.routes.draw do

	root 'sprints#new'
  resources :users
  resources :tasks
  resources :sprints
  resources :user_stories
  post "tasks/new", :to => "tasks#create"
  post "sprints/new", :to => "sprints#create"
  post "/", :to => "sprints#create"
  post "user_stories/new", :to => "user_stories#create"

end
