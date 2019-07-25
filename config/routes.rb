 Rails.application.routes.draw do
    root to: 'top_page#index'


    get  '/signup',  to: 'sellers#new'
    get  '/signup',  to: 'buyers#new'
    post '/signup',  to: 'sellers#create'
    post '/signup',  to: 'buyers#create'

    namespace :buyers do
    end

    namespace :sellers do
    end

    get    'sellers/log_in',   to: 'sellers/sessions#new'
    get    'buyers/log_in',   to: 'buyers/sessions#new'
    post   'sellers/log_in',   to: 'sellers/sessions#create'
    post   'buyers/log_in',   to: 'buyers/sessions#create'
    delete 'sellers/logout',  to: 'sellers/sessions#destroy'
    delete 'buyers/logout',  to: 'sessions#destroy'

    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new,:create,:edit, :update]

    resources :fabrics, only: %i[show new create edit update] do
        collection do
          post :preview
        end
    end
    resources :stocks, only: [:create, :destroy]
    resources :likes, only:[:create, :destroy]


end
