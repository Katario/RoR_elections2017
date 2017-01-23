Rails.application.routes.draw do

  get 'users/new'

  scope '/admin' do
    resources :tours
  end

  resources :candidates
end
