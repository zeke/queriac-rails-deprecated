Queriac::Application.routes.draw do
  # resources :queries
  # resources :commands

  mount_sextant if Rails.env.development?
  
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  match "/commands/new" => "commands#new", :as => :new_command

  match "/:nickname" => "users#show", :as => :user
  match "/:nickname/:keyword/show" => "commands#show", :as => :command
  match "/:nickname/:keyword_and_query" => "commands#execute"
  
  root :to => "static#index"
end
