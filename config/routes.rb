Todoapp::Application.routes.draw do
	root to: "teams#index"

  resources :users

  resources :teams do
  	resources :projects, :only => [:new]
  end

  resources :projects do
  	resources :items, :only => [:index]
  end

  resources :items, :except => [:index]
end
