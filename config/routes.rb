Rails.application.routes.draw do
  root 'sessions#home'
  get '/login' => 'sessions#new'
  post '/login' =>  'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users
end
