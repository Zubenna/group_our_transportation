Rails.application.routes.draw do
  root 'sessions#home'
  get '/login' => 'sessions#new'
  get '/external' => 'sessions#external'
  post '/login' =>  'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users
  resources :transportations
  resources :groups
end
