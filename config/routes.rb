Rails.application.routes.draw do

	devise_for :users, path: '', :controllers => {registrations: "registrations"}, path_names:{
		sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'create_store'
	}

	root :to => redirect("/login")
	resources :stores, param: :slug do
		post '/users', to: 'users#create'
		get '/users/new', to: 'users#new', as: 'new_user'
		resources :users
		resources :products, param: :slug
	end
	match '*a', :to => 'errors#routing', via: :get
end
