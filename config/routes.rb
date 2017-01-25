Rails.application.routes.draw do

  namespace 'admin' do
<<<<<<< HEAD
  	root 'connexions#new'

    get 'log_in' => "connexions#new", :as => "log_in"
    get 'log_out' => "connexions#destroy", :as => "log_out"

  	resources :admins
    resources :connexions
=======
    resources :tours
    resources :candidates
    resources :votes
>>>>>>> dev_alexis
  end
  resources :candidates
  resources :users
  resources :sessions
  resources :votes



  get 'sessions/new'
  get 'log_out' => "sessions#destroy", :as => "log_out"
  get 'log_in' => "sessions#new", :as => "log_in"
  get 'sign_up' => "users#new", :as => "sign_up"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
