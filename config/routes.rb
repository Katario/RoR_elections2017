Rails.application.routes.draw do

	scope '/admin' do
		resources :candidates
	end
	
  resources :admin_electeurs
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
