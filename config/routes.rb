Rails.application.routes.draw do
  # resources :books, only: [:index, :show] do
  #   resources :comments, only: [:index, :create, :update, :destroy]
  #   resources :ratings, only: [:create, :update, :destroy]
  # end

  resources :ratings
  resources :comments

  resources :users, only: [:index, :show, :create] do
    resources :books, only: [:index, :show], controller: 'users/books'
  end
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # # Defines the root path route ("/")
  # # root "articles#index"
  # post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy'
  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # post '/users/register', to: 'users#create'
  # post '/users/login', to: 'users#login'

    # Show all users
    get '/users', to: 'users#index'

    # Show a specific user by ID
    get '/users/:id', to: 'users#show'
 
    # Create a new user
    post '/users', to: 'users#create'
 
    # Log in a user
    post '/users/login', to: 'users#login'

     # Define the sign-in route
    get '/users/sign_in', to: 'sessions#new', as: 'new_user_session'

    # Session routes
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    resources :books

    # resources :users do
    #   resources :books
    # end
    

end
