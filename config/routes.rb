Rails.application.routes.draw do

  devise_for :users
  resources :users
  
  resources :electives
  
  
  root 'application#index'
  get '/users' => 'users#index'
  get '/assignments' => 'application#assignments'

end
