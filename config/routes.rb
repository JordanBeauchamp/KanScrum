KanScrum::Application.routes.draw do

  # Root
  root "static_pages#home"

  resources :users
  resources :tasks
  resources :sprints
  resources :user_stories
  post "tasks/new", :to => "tasks#create"
  post "sprints/new", :to => "sprints#create"
  post "user_stories/new", :to => "user_stories#create"
  post '/tasks/update_status/:id&:task_status', to: 'tasks#update_status'

  get "sessions/login"
  get "static_pages/home"
  get "sessions/home"
  post "sessions/login_attempt"
end
