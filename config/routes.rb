Queriac::Application.routes.draw do
  mount_sextant if Rails.env.development?

  resources :users, :only => [:index, :show] do
    resources :commands
  end
  
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  # match "/:nickname" => "users#show", :as => :user
  # match "/:nickname/:keyword/show" => "commands#show", :as => :command
  # match "/:nickname/:keyword/edit" => "commands#edit", :as => :edit_command
  match "/exec/:keyword_and_args" => "commands#execute"
  
  root :to => "static#index"
end
