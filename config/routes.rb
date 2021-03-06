Rails.application.routes.draw do
  get 'user_sessions/new'

  # welcome page is root
  root 'welcome_page#welcome'
  get '/welcome', to: 'welcome_page#welcome'

  # static pages
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  get '/contact', to: 'static_pages#contact'
  get '/driver_guidelines', to: 'static_pages#driver_guidelines'
  get '/washer_guidelines', to: 'static_pages#washer_guidelines'

  # new user
  get '/new_user', to: 'users#new'
  post '/new_user', to: 'users#create'

  # driver controller actions
  get '/new_driver', to: 'users#new_driver'
  post '/new_driver', to: 'users#create_driver'

  # washer controller actions
  get '/new_washer', to: 'users#new_washer'
  post '/new_washer', to: 'users#create_washer'

  #sessions
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get '/washer_tools', to: 'washers#home'

  # resources
  resources :user_sessions
  resources :loads
  resources :users
  resources :washers
  resources :drivers
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
