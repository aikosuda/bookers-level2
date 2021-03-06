Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	root 'homes#top'

  	get 'home/about' => 'homes#about'
	
	resources :books, only: [ :index, :show, :create, :edit, :update, :destroy] do
		resource :favorites, only: [:create, :destroy]
	end

	resources :users, only: [:show, :index, :edit, :update]	

	get 'search' => 'search#search'

end
