Rails.application.routes.draw do
  get 'home/index'
  get 'tasks/week'
  get 'tasks/alarm'
  get 'tasks/day'
  get 'tasks/cfg'
  get 'tasks/atten'
  get 'tasks/reset'
  get 'memos/calendar'
  get 'tasks/list/:week', to: 'tasks#list', as: 'week_list'
  devise_for :users
  resources :tasks
  resources :memos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get "home/top" => "home#top"


	devise_scope :user do
    	get '/users/sign_out' => 'devise/sessions#destroy'
  	end
    authenticated :users do
		root :to => "tasks#alarm"
	end

	unauthenticated :users do
	    root :to => "home#index"
	end
end
