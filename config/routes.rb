Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	scope module: 'api' do
		namespace :v1 do
		  resources :users 
		  get '/reset' => 'users#reset'
		  post '/transfer' => 'users#transfer'

          get '/get_amounts/:id' => 'users#get_amounts'
		end
	end
end
