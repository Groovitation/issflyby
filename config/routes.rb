Issflyby::Application.routes.draw do
  resources :subscriptions

  resources :spacepeople

	resources :passes
	resources :spacecrafts

	root :to => 'application#index'
	get '/auth/:provider/callback', to: 'sessions#create'
	get '/sign_in', to: 'sessions#new', as: 'sign_in'
end
