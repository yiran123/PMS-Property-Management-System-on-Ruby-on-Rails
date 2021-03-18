Rails.application.routes.draw do
  resources :rooms

  resources :guests do
  	resources :assignments, except: [:index], controller: 'guests/assignments'
  end
  
  # get 'home/index'
  root 'home#index'
  get 'home/guest'
  get 'home/room'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
