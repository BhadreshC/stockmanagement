Rails.application.routes.draw do
	devise_for :users, path: '', path_names:{
		sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'create_store'
	}
	# root to: "stores#index"
	root :to => redirect("/login")
	# resources :naresh , param: :slug
	resources :stores do
		post '/users', to: 'users#create'
		get '/users/new', to: 'users#new', as: 'new_user'
		resources :users
	end
	match '*a', :to => 'errors#routing', via: :get
end
