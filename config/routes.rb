Rails.application.routes.draw do
  	#user routes
  root to: "sites#index"

 	 #session routes
  get "/sign_in", to: "sessions#new"

  post "/sessions", to: "sessions#create"
  delete '/sessions', to: "sessions#destroy"

 	 #decision routes
  get "/decisions/new", to: "decisions#new", as: "new_decision"

	#resources for users
  resources :users

	#resources for decisions, options and factors
  resources :decisions do
    member do
      get 'change_score'
      patch 'update_score'
    end
  	resources :options
  	resources :factors
    resources :metrics   #metrics is OptionFactor joint table
  end

end
