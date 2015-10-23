Rails.application.routes.draw do
  	#user routes
  root to: "sites#index"

 	 #session routes
  get "/sign_in", to: "sessions#new"

  post "/sessions", to: "sessions#create"
  delete '/sessions', to: "sessions#destroy"

 	 #decision routes
  get "/decisions/new", to: "decisions#new", as: "new_decision"
  #delete '/decisions/:id', to: "decisions#destroy"


	#resources
  resources :users

end
