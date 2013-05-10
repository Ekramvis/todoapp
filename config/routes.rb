Todoapp::Application.routes.draw do
  resources :users
  resources :teams
  resources :projects
  resources :items
end
