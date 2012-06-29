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
  
  # match "/:user/:command_string" => "commands#execute"
  
  root :to => "static#index"
end
