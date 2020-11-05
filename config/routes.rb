Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :events
  resources :users
  resources :sessions

  # get '/current_user', to: 'application#current_user', as: :current_user
  
end
