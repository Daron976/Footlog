Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'users#index'
  get '/users/:author_id', to: 'users#show'
  get '/users/:author_id/posts', to: 'posts#index'
  get '/users/:author_id/posts/:post_id', to: 'posts#show'
end
