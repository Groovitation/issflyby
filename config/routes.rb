Issflyby::Application.routes.draw do

  resources :passes

	root :to => 'application#index'
	get '/auth/:provider/callback', to: 'sessions#create'
	get '/sign_in', to: 'sessions#new', as: 'sign_in'
end
