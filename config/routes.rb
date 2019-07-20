Rails.application.routes.draw do
  resources :top_pages
  root to: 'top#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'buyers#new'
  get 'signup', to: 'sellers#new'

  scope '/admin' do
  resources :buyers, only: [:index, :show, :new, :cretae, :update]
  end

  scope '/admin' do
  resources :sellers, only: [:index, :show, :new, :cretae, :update]
  end

  resources :stocks, only: [:index, :show, :new, :cretae, :update]
    post   '/stocks',   to: 'stocks#create'

  resources :fabrics, only: [:show, :new, :create, :edit, :update] do

  resources :likes, only:[:create, :destroy]
    collection do
        get :orders
    end
  end

  resources :orders, only:[ :new, :create, :destroy ]

end
