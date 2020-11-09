Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :events, defaults: {format: :json}
  resources :users, defaults: {format: :json}
  resources :rsvps, defaults: {format: :json}
  resources :sessions, defaults: {format: :json}

  # get '/current_user', to: 'application#current_user', as: :current_user
  
end
