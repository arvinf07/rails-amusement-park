Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signin', to: 'sessions#create'
  post '/signin', to: 'sessions#signin'
  get '/logout', to: 'sessions#destroy'
  resources :users
  resources :attractions
  post '/attractions/:id', to: 'attractions#ride'
  root :to => 'welcome#index'

end
 