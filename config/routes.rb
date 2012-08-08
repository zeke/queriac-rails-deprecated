Queriac::Application.routes.draw do
  mount_sextant if Rails.env.development?

  resources :users, :only => [:index, :show] do
    resources :commands
  end
  
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  match "/exec/:keyword_and_args" => "commands#execute"

  match "/engine" => "static#engine", :as => :engine
    
  root :to => "static#index"
end
