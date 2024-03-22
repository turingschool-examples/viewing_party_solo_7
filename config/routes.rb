Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")


  root "welcome#index"
  get '/register', to: 'users#new', as: 'register_user'

  resources :users, only: [:show, :create] do
    get 'discover', to: 'users#index', as: 'discover', on: :member

    resources :movies, only: [:index, :show] do
      get 'similar', on: :member
      resources 'viewing_parties', only: [:new, :create], on: :member
    end
  end
end
