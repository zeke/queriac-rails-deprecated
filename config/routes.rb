Queriac::Application.routes.draw do
  resources :queries
  resources :commands
  
  match "/test/:msg" => "static#test"

  mount_sextant if Rails.env.development?
  
  # match "/:user_id/:command_and_query" => "commands#execute"
  
  root :to => "static#index"
end
