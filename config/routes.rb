Rails.application.routes.draw do

  get 'sessions/new'

  scope '/admin' do
    resources :tours
  end

  resources :candidates
end
