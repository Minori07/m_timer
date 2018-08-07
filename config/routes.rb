Rails.application.routes.draw do
  get 'tasks/week'
  get 'tasks/alarm'
  get 'tasks/day'
  devise_for :users
  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get "home/top" => "home#top"
end
