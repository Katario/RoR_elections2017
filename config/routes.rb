Rails.application.routes.draw do


  namespace 'admin' do
    resources :tours
  end
  resources :candidates
  resources :users
  resources :sessions

  get 'sessions/new'
  get 'log_out' => "sessions#destroy", :as => "log_out"
  get 'log_in' => "sessions#new", :as => "log_in"
  get 'sign_up' => "users#new", :as => "sign_up"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
