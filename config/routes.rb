Rails.application.routes.draw do
  get 'sessions/new'
  resources :stocks
  resources :likes
  resources :fabrics
  resources :buyers
  resources :sellers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
