Rails.application.routes.draw do
  devise_for :users
  
  
  root to: "top#index"
 
  
  resources :users, only: [:show,:edit,:update]
  
  
  
  
  resources :questions, only: [:create,:show,:search]
  resources :answers, only: [:new,:create]
  
end