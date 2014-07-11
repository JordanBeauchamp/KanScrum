KanScrum::Application.routes.draw do

  resources :teams

  # Root
  root "static_pages#home"

  resources :users
  resources :tasks
  resources :sprints
  resources :user_stories
  post "tasks/new", :to => "tasks#create"
  post "sprints/new", :to => "sprints#create"
  post "user_stories/new", :to => "user_stories#create"
  post "/tasks/update_status/:id&:task_status", to: "tasks#update_status"
  post "/tasks/assign_user/:id&:user_id", to: "tasks#assign_user"
  post "/user_stories/update_priority/", to: "user_stories#update_priority"

  get "static_pages/home"
  get "sessions/home"
  get "sessions/destroy"
  post "sessions/login_attempt"
end
