Todoapp::Application.routes.draw do
	root to: "teams#index"

  resources :users
  resources :teams
  resources :projects
  resources :items
end
