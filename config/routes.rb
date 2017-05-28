Rails.application.routes.draw do

  resources :electives
  devise_for :users
  root 'application#index'
  
end
