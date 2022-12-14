Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  root "users#index"
  get '/user/information', to: "users#information"
  resources :users do
     resources :events do
      resources :invitations , only: [:create]
     end
     resources :categories, only: [:create]
  end
  resources :attend_events
  resources :categories,only: [ :index]

  default_url_options :host => 'localhost:3000'

end
