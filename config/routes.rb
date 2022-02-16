Rails.application.routes.draw do
    
  root to: 'flights#index'
    
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
  get '/login' => 'session#new'
  post '/login' => 'session#create' 
  delete '/login' =>'session#destroy'

  get '/flights/search' =>'flights#search'

  resources :flights
  resources :airplanes
  resources :users



end
