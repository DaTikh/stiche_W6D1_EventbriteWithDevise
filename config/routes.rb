Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users
  resources :events
  get "/profil", to: 'events#profile', as: "user"
  put "/events", to: "events#subscribe", as: "subscribe"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
