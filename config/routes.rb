Queriac::Application.routes.draw do
  mount_sextant if Rails.env.development?

  resources :users, :only => [:index, :show] do
    resources :commands do
      member do
         get 'fork'
       end
    end
  end
  
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  match "/v2" => "commands#execute"
  match "/v3" => "commands#execute"
  match "/v4" => "commands#execute"
  match "/exec/:keyword_and_args" => "commands#execute"

  match "/engine" => "static#engine", :as => :engine
  match "/help" => "static#help", :as => :help
    
  root :to => "static#index"
end
