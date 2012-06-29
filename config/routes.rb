Queriac::Application.routes.draw do
  resources :queries
  resources :commands

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  devise_scope :user do
    resources :commands do
      resources :queries, :only => [:index]
    end
  end
  
  match "/test/:msg" => "static#test"

  mount_sextant if Rails.env.development?
  
  # match "/:user_id/:command_and_query" => "commands#execute"
  
  root :to => "static#index"
end
