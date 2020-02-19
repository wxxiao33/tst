Rails.application.routes.draw do
  get 'home_page/home'
  resources :participate_ins
  resources :histories
  resources :favorites
  resources :challenges
  resources :users

  root 'home_page#home' 
end
