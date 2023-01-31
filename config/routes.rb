Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'users#index', as: 'root'
  get '/users/new_post', to: 'posts#new', as: 'create_new_post'
  post '/users/new_post', to: 'posts#create'
  get '/users/:post_id/new_comment', to: 'comments#new', as: 'create_new_comment'
  post '/users/:post_id/new_comment', to: 'comments#create'
  get '/users/:author_id', to: 'users#show', as: 'users_show'
  get '/users/:author_id/posts', to: 'posts#index', as: 'posts_index'
  get '/users/:author_id/posts/:post_id', to: 'posts#show', as: 'posts_show'
  get '/users/:author_id/posts/:post_id/liked_post', to: 'posts#like'
end
