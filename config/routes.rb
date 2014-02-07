Issflyby::Application.routes.draw do
  resources :cards

  resources :subscriptions

  resources :spacepeople

	resources :passes
	resources :spacecrafts

	root :to => 'application#index'
	get '/auth/:provider/callback', to: 'sessions#create'
	get '/sign_in', to: 'sessions#new', as: 'sign_in'
	get '/sign_out', to: 'sessions#destroy', as: 'sign_out'
  get '/demo_card', to: 'users#demo_card', as: 'demo_card'
end
