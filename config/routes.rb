 Rails.application.routes.draw do
    root to: 'top_page#index'

    get  '/signup',  to: 'sellers#new'
    get  '/signup',  to: 'buyers#new'
    post '/signup',  to: 'sellers#create'
    post '/signup',  to: 'buyers#create'

    get    'sellers/log_in',   to: 'sessions#new'
    get    'buyers/log_in',   to: 'sessions#new'
    post   'sellers/log_in',   to: 'sessions#create'
    post   'buyers/log_in',   to: 'sessions#create'
    delete 'sellers/logout',  to: 'sessions#destroy'
    delete 'buyers/logout',  to: 'sessions#destroy'

    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new,:create,:edit, :update]

    resources :fabrics, only:[:show,:new,:create,:edit,:update]
    resources :stocks, only: [:create, :destroy]
    resources :likes, only:[:create, :destroy]

    resources :buyers, only: [:index, :show, :new, :create, :update]
    resources :buyers, only: [:index, :show, :new, :create, :update]

end
