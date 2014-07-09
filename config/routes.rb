KanScrum::Application.routes.draw do

  # Root
  root "static_pages#home"

  resources :teams
  resources :users
  resources :tasks
  resources :sprints
  resources :user_stories
  post "tasks/new", :to => "tasks#create"
  post "sprints/new", :to => "sprints#create"
  
  post "user_stories/new", :to => "user_stories#create"
  post "user_stories/update_priority", to: "user_stories#update_priority"

  post "tasks/update_status/:task_id&:task_status", to: "tasks#update_status"
  post "tasks/assign_user/:task_id&:user_id", to: "tasks#assign_user"
  post "tasks/unassign_user/:task_id", to: "tasks#unassign_user"

  get "static_pages/home"
  get "sessions/home"
  get "sessions/destroy"
  post "sessions/login_attempt"
end
