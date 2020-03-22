Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'pages/home'
  resources :participate_ins
  resources :histories
  resources :favorites
  resources :challenges
  resources :users

  root                         'pages#home' 
  get    '/about',         to: 'pages#about'
  get    '/signup',        to: 'users#new'
  get    '/new_challenge', to: 'challenges#new'
  get    '/login',         to: 'sessions#new'
  post   '/login',         to: 'sessions#create'
  delete '/logout',        to: 'sessions#destroy'

  get    '/search',        to: 'pages#search'
  get    '/search_result', to: 'pages#result'
 
  post '/participate/:challenge_id', to: 'users#participate'
  delete '/drop/:challenge_id', to: 'users#drop'

  post '/favorite/:challenge_id', to: 'users#favorite'
  delete '/unfavorite/:challenge_id', to: 'users#unfavorite'

end
