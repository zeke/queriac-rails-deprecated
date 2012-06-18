Queriac::Application.routes.draw do
  resources :queries
  resources :commands
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root :to => "static#index"
end
