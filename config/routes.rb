Rails.application.routes.draw do

  get 'users/new'

  scope '/admin' do
    resources :tours
  end

  resources :candidates
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
