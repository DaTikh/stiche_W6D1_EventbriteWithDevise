Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users
  resources :events
  get "/profil", to: 'events#profile', as: "user"
  post "/events/subscribe", to: "events#subscribe", as: "subscribe"
  post "/events/subscribe/payment", to: "events#payment", as: "payment"
  delete "/events", to: "events#unsubscribe", as: "unsubscribe"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
