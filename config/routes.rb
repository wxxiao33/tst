Rails.application.routes.draw do
  resources :participate_ins
  resources :histories
  resources :favorites
  resources :challenges
  resources :users

  root 'application#hello' 
end
