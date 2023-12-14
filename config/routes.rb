Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "users#index"
  # Get /users
  get '/users', to: 'users#index' 
  # Get /users/id
  get '/users/:id', to: 'users#show' 
  # Get /users/id/posts
  get '/users/:user_id/posts', to: 'posts#index' 
    # Get /users/id/posts/new
  get '/users/:user_id/posts/new', to: 'posts#new' 
  # Get /users/user_id/posts/id
  get '/users/:user_id/posts/:id', to: 'posts#show' 
  # like post
  post '/users/:user_id/posts/:post_id/likes', to: 'likes#create', as: 'user_post_likes'
  #add comment to post
  post '/users/:user_id/posts/:post_id/comments', to: 'comments#create', as: 'user_post_comments'
  resources :users do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:index, :new, :create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end
end
