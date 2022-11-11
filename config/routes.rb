Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  root "users#index"
 
  resources :users do
     resources :events do
      resources :invitations , only: [:create]
     end
  end
  resources :attend_events

end
