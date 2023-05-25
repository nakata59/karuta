Rails.application.routes.draw do
  resources :bus_schedules
  resources :bus_lines
  resources :users, only: %i[new create]
  resources :list_bus_schedules
  resources :players, only: %i[new index]
  root 'users#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/players/first_join', to: 'players#first_join'
  get '/players/second_join', to: 'players#second_join'
  get '/players/entry', to: 'players#entry'
  get '/questions/entry', to: 'questions#next'
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
  # Defines the root path route ("/")
  # root "articles#index"
end
