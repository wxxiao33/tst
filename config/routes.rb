Rails.application.routes.draw do
  resources :participate_ins
  resources :histories
  resources :favorites
  resources :challenges
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Rails.application.routes.draw do 
  # resources :participate_ins
  # resources :histories
  # resources :favorites
  root 'application#hello' 
  # end 
end
