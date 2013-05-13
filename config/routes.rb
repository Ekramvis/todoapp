Todoapp::Application.routes.draw do
	# REV: I would suggest only nesting routes where you need info from a ?query
  # REV: string. Like you did with putting the project_new route in teams.
	root to: "teams#index"

  resources :users

  resources :teams do
  	resources :projects, :only => [:new]
  end

  resources :projects do
  	# REV: Can do @project.items instead of nesting
  	resources :items, :only => [:index]
  end

  resources :items, :except => [:index]
end
