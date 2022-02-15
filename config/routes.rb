Rails.application.routes.draw do

  resources :flights

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: '/flights'
  
  get '/login' => 'session#new'
  post '/login' => 'session#create' 
  delete '/login' =>'session#destroy'

end
